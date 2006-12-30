From: "Michael S. Tsirkin" <mst@mellanox.co.il>
Date: Sat, 30 Dec 2006 18:49:59 +0000
Subject: Re: No sound in KDE with intel hda since 2.6.20-rc1
Message-Id: <20061230184959.GC4225@mellanox.co.il>
List-Id: <linux-sound.vger.kernel.org>
References: <20061229062559.GB16659@mellanox.co.il>
In-Reply-To: <20061229062559.GB16659@mellanox.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, PeiSen Hou <pshou@realtek.com.tw>

> Since 2.6.20-rc1 (tested both -rc1 and rc2), system notification sounds under
> KDE, and sound in games (e.g. TuxPaint) no longer seem to work on my T60
> thinkpad. Works fine under 2.6.19 though.  The strange thing is e.g. Amarok
> still plays music fine.

Update: Amarok was set to auto-detect the backend, KDE uses ALSA backend.
On 2.6.20-rc2, if I force Amarok to alsa backend, I get a message that
xine could not initialized any drivers and no sound. If I force it
to use oss interface Amarok works fine.

On 2.6.19 both alsa and oss work fine.

So it seems that something broken in the alsa API in my 2.6.20-rc2.


-- 
MST
