From: Vladis Dronov <vdronov@redhat.com>
Date: Wed, 30 Mar 2016 19:03:21 +0000
Subject: [PATCH] ALSA: usb-audio: Fix double-free in snd_usb_add_audio_stream()
Message-Id: <1459364602-28997-1-git-send-email-vdronov@redhat.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org

Hello, Takashi, Jaroslav, all,
Please, see the research and the following patch on a double-free bug in [s=
nd-usb-audio].

1) The upstream commits 0f886ca1, 902eb7fd and 447d6275f (many thanks to Ta=
kashi Iwai) revealed that there is a double-free bug in [snd-usb-audio] mod=
ule due to alloc/free logic flaw in snd_usb_add_audio_stream() function. A =
double-free leads to kernel structure/list/slab corruptions and shortly to =
null-deref, GPF or lockup.

2.1) Let me describe what happens with the current code in usb_audio_probe(=
), create_fixed_stream_quirk() and snd_usb_add_audio_stream():

> [ sound/usb/card.c ]
> static int usb_audio_probe(struct usb_interface *intf,
>                            const struct usb_device_id *usb_id)
> {
>         ...
>         if (quirk && quirk->ifnum !=3D QUIRK_NO_INTERFACE) {
>                 /* need some special handlings */
>                 err =3D snd_usb_create_quirk(chip, intf, &usb_audio_drive=
r, quirk);
>                 if (err < 0)
>                         goto __error;
>         }
>         ...
>  __error:
>         if (chip) {
>                 if (!chip->num_interfaces)
>                         snd_card_free(chip->card);

Somewhere in the middle of usb_audio_probe() the function snd_usb_create_qu=
irk() is called, and if it returns with an error and no interfaces were cre=
ated, the sound card is destroyed with "snd_card_free(chip->card)".

2.2) create_fixed_stream_quirk() is called from snd_usb_create_quirk():

> [ sound/usb/quirks.c ]
> static int create_fixed_stream_quirk(struct snd_usb_audio *chip,
>                                      struct usb_interface *iface,
>                                      struct usb_driver *driver,
>                                      const struct snd_usb_audio_quirk *qu=
irk)
> {
>         struct audioformat *fp;
>         struct usb_host_interface *alts;
>         struct usb_interface_descriptor *altsd;
>         ...
>         fp =3D kmemdup(quirk->data, sizeof(*fp), GFP_KERNEL);
>         ...
> (*)     stream =3D (fp->endpoint & USB_DIR_IN)
> (*)             ? SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
> (*)     err =3D snd_usb_add_audio_stream(chip, stream, fp);
> (*)     if (err < 0)
> (*)             goto error;
>=20
>         if (fp->iface !=3D get_iface_desc(&iface->altsetting[0])->bInterf=
aceNumber ||
>             fp->altset_idx >=3D iface->num_altsetting) {
>                 err =3D -EINVAL;
>                 goto error;
>         }
>         alts =3D &iface->altsetting[fp->altset_idx];
>         altsd =3D get_iface_desc(alts);
>         if (altsd->bNumEndpoints < 1) {
>                 err =3D -EINVAL;
>                 goto error;
>         }
>         ...
>  error:
>         kfree(fp);
>         kfree(rate_table);
>         return err;
> }

2.3) *fp is allocated and passed to snd_usb_add_audio_stream() where snd_us=
b_init_substream() is called:

> [ sound/usb/stream.c ]
> int snd_usb_add_audio_stream(struct snd_usb_audio *chip,
>                              int stream,
>                              struct audioformat *fp)
> {
>         struct snd_usb_stream *as;
>         struct snd_usb_substream *subs;
>         struct snd_pcm *pcm;
>         ...
>         /* create a new pcm */
>         as =3D kzalloc(sizeof(*as), GFP_KERNEL);
>         ...
>         snd_usb_init_substream(as, stream, fp);

2.4) In turn snd_usb_init_substream() adds audioformat *fp by its &fp->list=
 to substream's fmt_list list:

> [ sound/usb/stream.c ]
> static void snd_usb_init_substream(struct snd_usb_stream *as,
>                                    int stream,
>                                    struct audioformat *fp)
> {
>         struct snd_usb_substream *subs =3D &as->substream[stream];
>=20
>         INIT_LIST_HEAD(&subs->fmt_list);
>         ...
>         list_add_tail(&fp->list, &subs->fmt_list);
>         subs->num_formats++;

2.5) Things go bad from this point in case snd_usb_add_audio_stream() or th=
e caller go the error path. The bug is that the caller frees (see "error: k=
free(fp);" code) *fp on the error path, BUT the pointer to the already-free=
d memory remains in the substream's fmt_list list.

The double-free happens after create_fixed_stream_quirk() returns with an e=
rror and usb_audio_probe() calls snd_card_free()->...->snd_usb_audio_pcm_fr=
ee()->free_substream(). As subs->fmt_list is already corrupted, iterating i=
t with list_for_each_entry_safe() leads to any and unpredictable results.

> static void free_substream(struct snd_usb_substream *subs)
> {
>         struct audioformat *fp, *n;
>         ...
>         list_for_each_entry_safe(fp, n, &subs->fmt_list, list) {
>         ...
>                 kfree(fp);

3.1) The crash is reproduceable by faking the USB device with no endpoints =
as described in https://bugzilla.redhat.com/show_bug.cgi?id=1283355 and htt=
ps://bugzilla.redhat.com/show_bug.cgi?id=1283358.

Please see as a proof the following kernel log with debug printing added to=
 the code. First, *fp is added to fmt_list in snd_usb_init_substream():

[  322.797223] usb 1-1: new full-speed USB device number 2 using xhci_hcd
[  322.974083] usb 1-1: config 1 interface 0 altsetting 0 has 3 endpoint de=
scriptors, different from the interface descriptor's value: 0
[  322.987031] usb 1-1: New USB device found, idVendor=045e, idProduct=0283
[  322.998318] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[  323.083913] media: Linux media interface: v0.10
[  323.231249] init_substream: add_tail() fp=FFff88003364ba80 fp->list.next=
=FFff8800b1e898b8 fp->list.prev=FFff8800b1e898b8 fmt_list=FFff8800b1e898b8 =
fmt_list.next=FFff88003364ba80 prev=FFff88003364ba80 num_formats=3D1

As you can see we have a correct list here with head at fmt_list=FFff8800b1=
e898b8 and single element fp=FFff88003364ba80.

3.2) The code finds out that there are too few endpoints present and goes t=
he error path (to the "error:" label):

[  323.307927] usb 1-1: too few endpoints
[  323.312964] trace-before-free: substream-0 ffff8800b1e89818 numf 1 fmt_l=
ist ffff8800b1e898b8 next ffff88003364ba80
[  323.353759] fp=FFff88003364ba80 next=FFff8800b1e898b8 prev=FFff8800b1e89=
8b8 rate=3D(null) chmap=3D(null)
[  323.362118] struct sane

As you can see the substream's fmt_list is sane at this point.

3.3) After "kfree(fp)" in the error path of create_fixed_stream_quirk() *fp=
 is freed, BUT the pointer to the freed memory remains in fmt_list. After *=
fp is freed the list is corrupted and contains trash:

[  323.371752] KFREE(fp) ffff88003364ba80
[  323.380383] trace-after-free: substream-0 ffff8800b1e89818 numf 1 fmt_li=
st ffff8800b1e898b8 next ffff88003364ba80
[  323.400003] fp=FFff88003364ba80 next=FFff88003364bf80 prev=FFff8800b1e89=
8b8 rate=3D(null) chmap=3D(null)
[  323.406786] fp=FFff88003364bf80 next=3D          (null) prev=3D         =
 (null) rate=3D(null) chmap=3D(null)
[  323.422211] next =3D NULL: FAIL, struct INSANE
[  323.436706] KFREE(rate_table) (null)

3.4) After error return from create_fixed_stream_quirk() the sound card is =
destroyed with "snd_card_free(chip->card)" in usb_audio_probe(). In the end=
 free_substream() is called:

[  323.511256] usb 1-1: snd_usb_create_quirk() failed: -22
[  323.565108] list_for_each_entry_safe(): fp=FFff88003364ba80 n=FFff880033=
64bf80
[  323.586337] kfree fp ffff88003364ba80                                  <=
<< DOUBLE-FREE
[  323.588509] loop-end: fp=FFff88003364ba80 n=FFff88003364bf80
[  323.599969] list_for_each_entry_safe(): fp=FFff88003364bf80 n=3D(null)
[  323.610460] kfree fp ffff88003364bf80                                  <=
<< FREEING SOMEONE ELSE'S MEMORY
[  323.613181] loop-end: fp=FFff88003364bf80 n=3D(null)                    =
 <<< NULL-PTR DEREF
...
[  324.247113] BUG: unable to handle kernel NULL pointer dereference at    =
       (null)
[  324.247533] IP: [<ffffffffc02d40ef>] free_substream.part.0+0xef/0x100 [s=
nd_usb_audio]
[  324.248088] PGD 0=20
[  324.248088] Oops: 0000 [#1] SMP=20
[  324.248088] Modules linked in: snd_usb_audio(+) snd_usbmidi_lib snd_hwde=
p ...
[  324.248088] CPU: 2 PID: 767 Comm: systemd-udevd Not tainted 4.5.0-vladis=
 #25
[  324.248088] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
rel-1.8.2-0-g33fbe13 by qemu-project.org 04/01/2014
[  324.248088] task: ffff880034718000 ti: ffff8800b2fbc000 task.ti: ffff880=
0b2fbc000
[  324.248088] RIP: 0010:[<ffffffffc02d40ef>]  [<ffffffffc02d40ef>] free_su=
bstream.part.0+0xef/0x100 [snd_usb_audio]
[  324.248088] RSP: 0018:ffff8800b2fbf898  EFLAGS: 00010217
...
[  324.248088] Call Trace:
[  324.248088]  [<ffffffffc02d43fa>] snd_usb_audio_pcm_free+0x9a/0xa0 [snd_=
usb_audio]
[  324.248088]  [<ffffffffc028d982>] snd_pcm_free+0x32/0xa0 [snd_pcm]
[  324.248088]  [<ffffffffc028da02>] snd_pcm_dev_free+0x12/0x20 [snd_pcm]
[  324.248088]  [<ffffffffc027d279>] __snd_device_free+0x29/0x70 [snd]
[  324.248088]  [<ffffffffc027d660>] snd_device_free_all+0x30/0x60 [snd]
[  324.248088]  [<ffffffffc02777a4>] release_card_device+0x34/0x90 [snd]
[  324.248088]  [<ffffffff815ae2b2>] device_release+0x32/0x90
[  324.248088]  [<ffffffff81455f8a>] kobject_release+0x7a/0x190
[  324.248088]  [<ffffffff81455e47>] kobject_put+0x27/0x50
[  324.248088]  [<ffffffff815ae5f7>] put_device+0x17/0x20
[  324.248088]  [<ffffffffc0277b57>] snd_card_free+0x67/0x90 [snd]
[  324.248088]  [<ffffffffc02c4f14>] usb_audio_probe+0x754/0x9d0 [snd_usb_a=
udio]
...

4.1) The suggested patch consists of 2 changes. First, I suppose we should =
move the code in create_fixed_stream_quirk() marked as "(*)" (see above) af=
ter "if (altsd->bNumEndpoints < 1)" check. This way no allocations is done =
if we go an error path. I've checked that fp->iface and fp->altset_idx are =
not changed in snd_usb_add_audio_stream() and functions called from it, so =
it is safe to swap these 2 pieces of code.

4.2) The problem with double-free still remains. I've verified that all the=
 callers of snd_usb_add_audio_stream() free *fp in case of error:

$ git grep snd_usb_add_audio_stream
sound/usb/quirks.c:     err =3D snd_usb_add_audio_stream(chip, stream, fp);

> *        err =3D snd_usb_add_audio_stream(chip, stream, fp);
> *        if (err < 0)
> *                goto error;
> * error:
> *        kfree(fp);
> *        kfree(rate_table);
> *        return err;

sound/usb/quirks.c:     err =3D snd_usb_add_audio_stream(chip, stream, fp);

> *        err =3D snd_usb_add_audio_stream(chip, stream, fp);
> *        if (err < 0) {
> *                kfree(fp);
> *                return err;
> *        }

sound/usb/stream.c:             err =3D snd_usb_add_audio_stream(chip, stre=
am, fp);

> *                err =3D snd_usb_add_audio_stream(chip, stream, fp);
> *                if (err < 0) {
> *                        kfree(fp->rate_table);
> *                        kfree(fp->chmap);
> *                        kfree(fp);
> *                        return err;
> *                }

This means that snd_usb_add_audio_stream() should remove *fp from the subst=
ream's fmt_list list on the error path, if it was already added. Such place=
s are:


> int snd_usb_add_audio_stream(struct snd_usb_audio *chip, int stream, stru=
ct audioformat *fp)
> {
>         struct snd_usb_stream *as;
>         struct snd_usb_substream *subs;
>         struct snd_pcm *pcm;
>         int err;
>=20
>         list_for_each_entry(as, &chip->pcm_list, list) {
>                 subs =3D &as->substream[stream];
>                 ...
>                         list_add_tail(&fp->list, &subs->fmt_list); <<< AD=
DING fp HERE
>                         subs->num_formats++;
>                         return 0;                                  <<< NO=
 ERROR PATH HERE
>                 }
>         }
>=20
>         /* look for an empty stream */
>         list_for_each_entry(as, &chip->pcm_list, list) {
>                 subs =3D &as->substream[stream];
>                 ...
>                 snd_usb_init_substream(as, stream, fp);  <<< ADDING fp HE=
RE, IF add_chmap() FAILS
>                 return add_chmap(as->pcm, stream, subs); <<< fp SHOULD BE=
 REMOVED FROM fmt_list
>         }
>=20
>         /* create a new pcm */
>         as =3D kzalloc(sizeof(*as), GFP_KERNEL);
>         err =3D snd_pcm_new(chip->card, "USB Audio", chip->pcm_devs,
>         ...
>         if (err < 0) {            <<< fp IS NOT ADDED YET HERE, SO FINE
>                 kfree(as);
>                 return err;
>         }
>         ...
>         snd_usb_init_substream(as, stream, fp);                 <<< ADDIN=
G fp HERE
>         ...                                                     <<< IF ad=
d_chmap() FAILS fp SHOULD
>         return add_chmap(pcm, stream, &as->substream[stream]);  <<< BE RE=
MOVED FROM fmt_list
> }

add_chmap() itself does not add anything to fmt_list list, so we indeed nee=
d to remove only the single list element from the list. Having all the abov=
e in mind, the patch follows.

4.3) How to handle possible error paths after successful call to snd_usb_ad=
d_audio_stream() in create_fixed_stream_quirk() is d
iscussable. Properly it should be like the below, but I believe it is overc=
omplication here would and stick to a simple error_after_add_audio_stream: =
label:

>  error2:
>         snd_usb_del_audio_stream(...something...);
>  error:
>         kfree(fp);
>         kfree(rate_table);
>         return err;

Best regards,
Vladis Dronov | Red Hat, Inc. | Product Security Engineer
