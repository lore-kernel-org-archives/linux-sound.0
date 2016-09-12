From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 12 Sep 2016 12:27:44 +0000
Subject: Re: [PATCH 1/4] hda: Rename fixup thinkpad_acpi to fixup_thinkpad
Message-Id: <s5htwdli9q7.wl-tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <5cb009b2-11a0-fb19-e751-965a874903b0@secunet.com>
In-Reply-To: <5cb009b2-11a0-fb19-e751-965a874903b0@secunet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dennis Wassenberg <dennis.wassenberg@secunet.com>
Cc: linux-input@vger.kernel.org, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, lukas@wunner.de, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Andrew Duggan <aduggan@synaptics.com>, perex@perex.cz, david.henningsson@canonical.com, vinod.koul@intel.com, hui.wang@canonical.com, rafael.j.wysocki@intel.com, jikos@kernel.org

On Mon, 12 Sep 2016 12:44:50 +0200,
Dennis Wassenberg wrote:
> 
> This is some preparatory work to not only support led control in
> thinkpad_helper over thinkpad_acpi.
> 
> A further patch will introduce led control over hid-lenovo.
> This will make it possible to use the thinkpad_helper not only with
> lenovo devices via acpi but also with hid-lenovo driver
> if there is a hid-lenovo compatible device found.
> 
> Signed-off-by: Dennis Wassenberg <dennis.wassenberg@secunet.com>

Since the functionality isn't changed by the name, I'd like to keep it
as is.  It makes the backporting still available / easier.

Of course, you can add comments to the fixup function accordingly.


thanks,

Takashi
