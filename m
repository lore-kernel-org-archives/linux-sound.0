From: Bill Nottingham <notting@redhat.com>
Date: Thu, 04 Oct 2001 14:19:56 +0000
Subject: Re: Problems recording sound with ISAPnp Soundcard since Kernel-2.4.x
Message-Id: <marc-linux-sound-100220533832552@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-100220329623616@msgid-missing>
In-Reply-To: <marc-linux-sound-100220329623616@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Magic Phibo (phibo@gmx.li) said: 
> I also tried the new isapnp support (included since Kernel-2.4.x) as module or
> directly in the kernel. Here is the output of 'dmesg':

If you use the new isapnp support, make sure you do *not* use
userland ISAPnP at the same time. They don't mix.

Bill
