From: Alessandro Zummo <azummo@ita.flashnet.it>
Date: Tue, 08 Feb 2000 09:31:25 +0000
Subject: Re: PnP support
Message-Id: <marc-linux-sound-95000642508760@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94986272808065@msgid-missing>
In-Reply-To: <marc-linux-sound-94986272808065@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

 On 07-Feb-00 at 17:49:20,
  Bill Nottingham <notting@redhat.com> wrote:

>>  I started adding PnP support for Soundblaster compatible
>>  soundcards.. i.e. the cards that works with the sb driver.
>> 
>>  Latest additions include CMI8330 and SoundBlaster AWE64 PnP.

> There's already some ISAPnP support in the 2.3.x kernels
> (for the SB driver, other drivers will probably be added
> soon if not already...); you'll want to look there to
> make sure you're not duplicating too much effort.

I reworked the 2.3.42/sb_card.c ... there were
some bugs... but i probably added some
bugs of mine, so the final count should be the same :-)

Anyway now AWE32 is supported too.

-- 

   - *Alex* -

  http://freepage.logicom.it/azummo/
