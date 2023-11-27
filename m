Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEADDAF
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 10:32:28 -0800 (PST)
Received: by m.b4.vu (Postfix, from userid 1000)
	id 5CE5A604F550; Tue, 28 Nov 2023 05:02:26 +1030 (ACDT)
Date: Tue, 28 Nov 2023 05:02:26 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC v2] ALSA: scarlett2: Add ioctls for user-space access
Message-ID: <ZWTgusFsOUfb90Xt@m.b4.vu>
References: <ZSqehHhedJQY9h/1@m.b4.vu>
 <76c1526d-78be-92d2-cf2b-148278394575@perex.cz>
 <ZS0tajzKr68CZ5uA@m.b4.vu>
 <123242ed-c343-dab8-fed1-9f5d2da44d7a@perex.cz>
 <ZS1asqF0cXRUzBwb@m.b4.vu>
 <87edhtn0r2.wl-tiwai@suse.de>
 <ZVpHX33vfzdjpH0z@m.b4.vu>
 <871qcfqnht.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871qcfqnht.wl-tiwai@suse.de>

Hi Takashi,

On Fri, Nov 24, 2023 at 02:39:26PM +0100, Takashi Iwai wrote:
> On Sun, 19 Nov 2023 18:35:27 +0100,
> Geoffrey D. Bennett wrote:
> > 
> > Hi Jaroslav, Takashi,
> > 
> > I took your feedback onboard about not providing generic access to the
> > scarlett2_usb() function from user-space.
> > 
> > After a few iterations, I've come up with this hwdep interface to
> > support reset-to-factory-defaults, reset-to-factory-firmware, and
> > firmware-update in a safe way:
> > 
> > -----8<-----8<-----8<-----8<-----8<-----8<-----8<-----8<-----8<-----
> > 
> > /* Get protocol version */
> > #define SCARLETT2_IOCTL_PVERSION _IOR('S', 0x60, int)
> > 
> > /* Reboot */
> > #define SCARLETT2_IOCTL_REBOOT _IO('S', 0x61)
> > 
> > /* Select flash segment */
> > #define SCARLETT2_SEGMENT_ID_SETTINGS 0
> > #define SCARLETT2_SEGMENT_ID_FIRMWARE 1
> > #define SCARLETT2_SEGMENT_ID_COUNT 2
> > 
> > #define SCARLETT2_IOCTL_SELECT_FLASH_SEGMENT _IOW('S', 0x62, int)
> > 
> > /* Erase selected flash segment */
> > #define SCARLETT2_IOCTL_ERASE_FLASH_SEGMENT _IO('S', 0x63)
> > 
> > /* Get selected flash segment erase progress
> >  * 1 through to num_blocks, or 255 for complete
> >  */
> > struct scarlett2_flash_segment_erase_progress {
> >         unsigned char progress;
> >         unsigned char num_blocks;
> > };
> > #define SCARLETT2_IOCTL_GET_ERASE_PROGRESS \
> >         _IOR('S', 0x64, struct scarlett2_flash_segment_erase_progress)
> > 
> > -----8<-----8<-----8<-----8<-----8<-----8<-----8<-----8<-----8<-----
> > 
> > Does that look reasonable to you?
> > 
> > Broadly, it's used like this:
> > 
> > Reset to factory default configuration:
> > 
> > - ioctl select_flash_segment SCARLETT2_SEGMENT_ID_SETTINGS
> > - ioctl erase_flash_segment
> > - ioctl get_erase_progress (optional)
> 
> So the erase operation is asynchronous?  This sounds a bit dangerous.
> Will the driver block further conflicting operations until the erase
> finishes?

Yes it is asynchronous. I've made it so that it's not dangerous by
locking out any conflicting operations:
- Mixer operations that require device access return EBUSY
- The hwdep is marked as exclusive so other processes can't use it
- Subsequent hwdep operations (if get_erase_progress wasn't called)
  will block until the erase is complete

> > Erase firmware (reverts to factory firmware which is stored in a
> > different flash segment, inaccessible from these ioctls):
> > 
> > - ioctl select_flash_segment SCARLETT2_SEGMENT_ID_FIRMWARE
> > - ioctl erase_flash_segment
> > - ioctl get_erase_progress (optional)
> > 
> > Upload new firmware:
> > 
> > - write() <- a bunch of these, only permitted after the previous erase
> >   step was completed
> 
> The write op must accept partial writes, and it becomes cumbersome.
> Can it be a one-shot ioctl, too?

I considered one-shot ioctls, but as the erase & write operations take
some seconds, then it is not possible to provide feedback to the
end-user while the erase & write operations happen.

> > On completion:
> > 
> > - ioctl reboot
> > 
> > To confirm that this interface is sufficient, I have implemented it in
> > the scarlett2 driver and written a user-space utility which can
> > perform all the above operations.
> > 
> > I will clean up the implementation a bit and then submit for review;
> > just wanted to share the interface first in case you have any comments
> > at this point.
> 
> IMO, from the user POV, it's easier to have per-purpose ioctls,
> instead of combining multiple ioctl sequences.  Of course, it won't
> scale too much, but for the limited number of operations, it's
> clearer.
> 
> That is, we can provide just a few ioctls for reset-to-factory,
> reset-to-something-else, and update.
> 
> But, if you need asynchronous operations inevitably by some reason,
> it's a different story, though.

Just to provide progress feedback to the end-user.

I've written the CLI tool using the proposed ioctl interface, and it
works nicely:

https://github.com/geoffreybennett/scarlett2

[g@fedora ~]$ time scarlett2 update
Selected device Scarlett 4th Gen Solo
Found firmware version 2115 for Scarlett 4th Gen Solo:
  /usr/lib/firmware/scarlett2/scarlett2-1235-8218-2115.bin
Updating Scarlett 4th Gen Solo from firmware version 1974 to 2115
Resetting configuration to factory default...
Erase progress: Done!
Erasing upgrade firmware...
Erase progress: Done!
Firmware write progress: Done!
Rebooting interface...

real    0m5.919s
user    0m0.007s
sys     0m0.034s

The user experience would not be as nice with one-shot ioctls. And
using ioctls which block for a long time would make using them from
the GUI https://github.com/geoffreybennett/alsa-scarlett-gui/ rather
awkward. None of the other operations on the interface block for an
appreciable amount of time.

I've got a first draft of firmware update and Scarlett 4th Gen support
that I am sharing with others to test now. It's 48 commits, divided
into:
- 5 commits to add extra checks that are missing
- 5 commits for firmware management
- 20 commits refactoring the existing driver to allow Scarlett 4th Gen
  support to be added
- 18 commits adding the support (although the underlying Gen 4
  protocol is the same as the other series, there are many new
  different types of controls)

I've put those commits on this branch:
https://github.com/geoffreybennett/scarlett-gen2/tree/scarlett-gen4

Do you want me to share all 48 commits on the mailing list at once? Or
maybe just the first 5+5 commits for now and the rest after I get some
feedback from others?

Thanks,
Geoffrey.
