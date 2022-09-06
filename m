From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 06 Sep 2022 08:13:48 +0000
Subject: Re: [BUG] commit a8d302a0b77057568350fe0123e639d02dba0745 cause IO_PAGE_FAULT and a lot of errors
Message-Id: <CABXGCsNBzjRB4G-fRbnOOPcmsX4EcibCMtE5UTs0iiq7T_Nedg@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CABXGCsO+kB2t5QyHY-rUe76npr1m0-5JOtt8g8SiHUo34ur7Ww@mail.gmail.com>
 <87ilm3vbzq.wl-tiwai@suse.de> <875yi3froa.wl-tiwai@suse.de>
 <CABXGCsMQ5H23np6fMN=58CZ6cBiHFF4WGdKdbtYLFyAAeAu5rQ@mail.gmail.com>
 <874jxml7a4.wl-tiwai@suse.de> <87o7vuj8ao.wl-tiwai@suse.de>
In-Reply-To: <87o7vuj8ao.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org

On Mon, Sep 5, 2022 at 5:49 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> Even a simpler one below with a proper changelog.
>

Thanks!
I checked both the latest patches. Both solved the IO_PAGE_FAULT issue
and didn't cause any side effects.
Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

-- 
Best Regards,
Mike Gavrilov.
