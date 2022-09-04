From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Sun, 04 Sep 2022 22:40:48 +0000
Subject: Re: [BUG] commit a8d302a0b77057568350fe0123e639d02dba0745 cause IO_PAGE_FAULT and a lot of errors
Message-Id: <CABXGCsMQ5H23np6fMN=58CZ6cBiHFF4WGdKdbtYLFyAAeAu5rQ@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CABXGCsO+kB2t5QyHY-rUe76npr1m0-5JOtt8g8SiHUo34ur7Ww@mail.gmail.com>
 <87ilm3vbzq.wl-tiwai@suse.de> <875yi3froa.wl-tiwai@suse.de>
In-Reply-To: <875yi3froa.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org

On Sun, Sep 4, 2022 at 1:51 PM Takashi Iwai <tiwai@suse.de> wrote:
> Also, please check the patch below instead of the previous one, too.
> If this one works, it'd be a better choice.
>

I compiled the kernel only with the second patch.
I confirm that patch fixed the described problem.
No new problems were noticed during the day, thanks.

Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

-- 
Best Regards,
Mike Gavrilov.
