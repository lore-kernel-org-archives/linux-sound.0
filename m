From: Etienne Grossmann <etienne@isr.isr.ist.utl.pt>
Date: Mon, 26 Oct 1998 14:48:30 +0000
Subject: Re:  midiplay compilation
Message-Id: <marc-linux-sound-90942131029863@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90935107505446@msgid-missing>
In-Reply-To: <marc-linux-sound-90935107505446@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

  Hello,

  what is sched.h around line 36 ? Is it like : 
================================__BEGIN_DECLS

/* Set scheduling parameters for a process.  */
extern int __sched_setparam __P ((__pid_t __pid,
				  __const struct sched_param *__param));
extern int sched_setparam __P ((__pid_t __pid,
				__const struct sched_param *__param));
=================================
  Etienne
