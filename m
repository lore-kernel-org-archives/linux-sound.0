From: Sangohn Christian <Christian.Sangohn@b19.rwth-aachen.de>
Date: Sat, 20 Feb 1999 13:55:45 +0000
Subject: Re: kernel sound error
Message-Id: <marc-linux-sound-91951863130627@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91951643529951@msgid-missing>
In-Reply-To: <marc-linux-sound-91951643529951@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sat, 20 Feb 1999, Keith Duthie wrote:
>On Sat, 20 Feb 1999, Sangohn Christian wrote:
>
>> Hello Everyone!
>> 
>> Since a few days I'm getting the following error on my console:
>> Feb 20 14:05:44 sikasso kernel: Sound error: Couldn't allocate DMA buffer 
>> What's wrong?
>Not enough contiguous free memory below 16M. Try using the dmabuf=1 option
>so some memory is permanently held for dma.

Which module should I use this option for? sound soundmodule or sb?
>-- 
>.sig under deconstruction. Please watch out for falling stars.
>                           O-        +++ATH0
--
   ,---._____________________________
  /                                  \   |~~\_____/~~\__  |
 | sango-ch@reze-1.rz.rwth-aachen.de  >---\______=== )-+
 |  ,---.___________________________/            ~~~|/~~  |
 |/                                                 ()
