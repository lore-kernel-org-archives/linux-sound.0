From: Guenther Sohler <guenther.sohler@newlogic.com>
Date: Sat, 16 Nov 2002 10:42:39 +0000
Subject: Re: creating a software driver
Message-Id: <marc-linux-sound-103744337230076@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-103742816723431@msgid-missing>
In-Reply-To: <marc-linux-sound-103742816723431@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

A very tiny template of such a character device driver is

#include <linux/module.h>

#define MY_MOD_MAJOR    253


static int my_mod_release (struct inode *inode, struct file *file);
static int my_mod_open (struct inode *inode, struct file *file);
static int my_mod_ioctl (struct inode *inode, struct file *file,
                         unsigned int cmd, unsigned long arg);



static struct file_operations my_mod_fops = {
  ioctl:my_mod_ioctl,
  open:my_mod_open,
  release:my_mod_release,
};


static struct parport *pp_use;
static unsigned char shadow[3];


static int
my_mod_release (struct inode *inode, struct file *file)
{
  MOD_DEC_USE_COUNT;
  return 0;
}

static int
my_mod_open (struct inode *inode, struct file *file)
{
  MOD_INC_USE_COUNT;
  return 0;
}


static int
my_mod_ioctl (struct inode *inode, struct file *file, unsigned int cmd,
              unsigned long arg)
{
  int byte, bit, val=0, i;
  printk("%d %d\n",cmd,arg);
  return 0;
//or   return -EINVAL;
}



int
init_module (void)
{
  register_chrdev (MY_MOD_MAJOR, "my_mod", &my_mod_fops);
  printk("Init\n");
  return 0;
}

void
cleanup_module (void)
{
  printk("Release\n");
  unregister_chrdev (MY_MOD_MAJOR, "my_mod");
}

I compile this with 

gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce 
-m486 -malign-loops=2 -malign-jumps=2 -malign-functions=2 -DCPUX6 -DMODULE  
-c -o  parbit.o parbit.c

I dont know which options are really neccesary but for sure __KERNEL__ and
-MODULE

Dont forget to create a character device with mknod


Please tell me how it works for you


rds Guenther


