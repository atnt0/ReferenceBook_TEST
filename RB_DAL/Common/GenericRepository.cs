
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RB.DAL.Common
{
    public abstract class GenericRepository<T, TKey> : IGenericRepository<T, TKey> where T : class, new()
    {
        DbContext context;
        protected DbSet<T> dbSet;
        public GenericRepository(DbContext context)
        {
            this.context = context;
            dbSet = context.Set<T>();
        }
        public void Create(T obj)
        {
            dbSet.Update(obj);
        }

        public void Update(T obj)
        {
            dbSet.Update(obj);
        }
        public void Delete(TKey id)
        {
            T obj = Get(id);
            dbSet.Remove(obj);

        }
        public virtual IQueryable<T> GetAll()
        {
            return dbSet;
        }
        public virtual IQueryable<T> FindBy(System.Linq.Expressions.Expression<Func<T, bool>> predicate)
        {
            return dbSet.Where(predicate);
        }

        public virtual T Get(TKey id)
        {
            return dbSet.Find(id);
        }


        public void Save()
        {
            context.SaveChanges();
        }
    }
}
