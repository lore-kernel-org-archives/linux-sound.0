Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491973B4EA2
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 15:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778166426; cv=pass; b=NMqRGiiQtL+pgLdPJaNCsaEVLjJ9kdflzD6dwXxBmXcUSqIVF10eA6yLoBwnaY1G46ExXVMGPZ+XYrcq+QeqWgK3YtGQCSaLct320222y4hVwzsWS2a6xQkDn0U3qr8FV2njkwbmkU8J+Wrg6ZSSrgQ3+HJtgKviavnND62GcsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778166426; c=relaxed/simple;
	bh=EKU+0kSScLbCSwZezj4/YdBmQTOvP/KrCHowmV2hZWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=cuA2OWjsWb7Ja7ygIAi+Ko5Q2WChaYZxlngqhnMhUCacCngDhVtgpINfey7iMtxqMnjlIhNkrWhWfU6l10+PVNWT8sMlYjIDURnB0IjnsYbUDZqh3hfj/MZDGu+RRgnX2BgTOEVoTfSe3AKuFRChUEG3lKUouoVinHFTC5izMEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n6Ro9R/w; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n6Ro9R/w"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7de4ed0593fso474942a34.1
        for <linux-sound@vger.kernel.org>; Thu, 07 May 2026 08:07:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778166422; cv=none;
        d=google.com; s=arc-20240605;
        b=Mo5R0kGKVGxWUSBRrzRt4Rq7HZTDMmY+9QfPFXjG0wGXyIFmKcWI1TJjjK5oqzLLAZ
         YKps5UCd6dBrphhE18Rn4BcPdOvnGdtaogbzxO2Yof2br4SnPX3lg53M/7H/cTLjGIQk
         c9zFJrUp0ff43+HDUWqRI8J2nUpgJnazSDBFgwUtTMJQIcZg7rF8AACdPNgJMv2sRikX
         H0WvmX2y34g1CTnY0m4uizkp/VyPAp4yDoOonCTEsgjVGz9fuPKMQ1Kkf2nt7mm+CC6V
         OeNGoBnSpSRr5zHeggK+E8XVLms2v8ysTvnjynS7CX7kTwmazrhC4bC4NM/Gs4399+Su
         3Rdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v6FuR/kW/KxNQcjL1SaMFnmvRfGtYr3nVyQynwtmM9g=;
        fh=eERFXPJNaRN2iVbz6EUhsTmd54egIOC7Euz15zyBytw=;
        b=DFV+AVoe6QGX+kJD/LFsdJC2Qjb5VVOPCJ8QT/pPVmurij9gjEy8nXHu19l+g0BfPM
         +5dEyNvAAtSQBwVucktJ8xWgDM5Nyr6sOanbeXaw6gR0Z4rcI+ZP5bthei2p4st4LZIn
         O2C8lpfBdiuOs3f05TpEz7xnhdqHQxqkGjUeQqeWTpTIq1qWpFzYMkHEqIX8R4ZWEhsx
         Vx1Q7oJ09aOVoSk/IahJgRBHpCwQRXh6iSAe5Ra1CJKokuCCyc1FlCnSUFXXV3BDbWBB
         wlCaFA3O1gOdMHudma9w1vrRYzVUFFGJOC38wU7rU2O4ufMUxDxxtiQ9BvoJg9AYbwwC
         V07A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778166422; x=1778771222; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6FuR/kW/KxNQcjL1SaMFnmvRfGtYr3nVyQynwtmM9g=;
        b=n6Ro9R/w5m0NjdH4oDCN251Rc8XdWvN4aOPAxXm+9jBcY4jlXttRo2xz/OQG7dbh6T
         y/SsXu0XzAS7BMvaJJ5u+/SFAxHn85pdEq5Y2X2pJJmNcVogwowSHM44QxkVRvB56epx
         snL4PJyZNjWsj12wmCtNr/NJAU54DUluUFxigjPTMBY1NDlOselSvYjNIOg4pYNtIyt4
         TWNJDLEx9v4w3pq4YrGlRKVEpLF2CI+iB889Fyhn5+r5mAd9QfX1zU/O4pl2gPl/6MAv
         pT/KF88gp7rjnVPmzV/tFuYtz8vImNOCoV6iU9y7gm7q2YSzFwvHlqOgQtkuYjr2kuhH
         aeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778166422; x=1778771222;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v6FuR/kW/KxNQcjL1SaMFnmvRfGtYr3nVyQynwtmM9g=;
        b=mF9kiCpval7u2cPjhjME3YqMLvgFpecp4ksB5s1PUayzBAQoBTFzIjxRJDFdR9xLoe
         x+5eKJg9/L/TtnDDAyCdPOVPpwgnmL4HCU9FonLcaxgA5/X4oBpT3Cuznf1sfk2crYCf
         uyW1mQErFQ9HDmME4CbPjS+S0I6m6iv82LIk3uHa65GTAuS13j9G1meyIWZVArgTnHqD
         VzTegRmfrMpNZUUmXATvwZfxQPTlufc1ZleLzXbEDyadxDd4pC0kTmz7B20ohyaPutxM
         YeKjJVHqyEgrTs21JERePh/GL+UCSzquTbsXLeOrMfkM5AC06JWbrEPwdjgPd08m8jZd
         sqIA==
X-Gm-Message-State: AOJu0Yxqg+a+QlL2mxx3lYrTPOAPR66YYx2fWtyqD9QTNLFrSEtoKXjC
	A0jOTKRuzb5MUd/9G868XJmljbJMnBPiG9AKrkNWunD3oG2JSDf2E9ctJ64UfgZWhAgXYTYTvYW
	AHKKHhTKTsLCkstTZM25LlyYO/KWLadDrMg==
X-Gm-Gg: AeBDiev1tU3B7cDoCtlEn0nnKKZvvjuCrRz1hjVYXoQdubz1+cacxZZlSjxfqduDZ/U
	1FrC61RMTSr+GzZi3I/6Kp9GTCIUegBau8KKj88AWLY2j4gR57Ep5p7DZhmcm5auG3f1KiEQt4C
	wj0GyTr3lyeWLfT2brTJpwSqmDrRBjL80ZUplZyWlSWOgMgBFifjPdQStSu0odgHdWgM1U2VChl
	Cuj3gr1G7Od/QQ9Y/QFXewZyMrclE6Tyt2KVYIvUx/kEtgidfC5g5So1N6RgTb0ZjOzCqNucx00
	wk4zEz2NCzyfKN62
X-Received: by 2002:a05:6809:143:20b0:480:77a1:c839 with SMTP id
 5614622812f47-48077a205b1mr126176b6e.36.1778166422274; Thu, 07 May 2026
 08:07:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <36875d66-f601-4d18-9654-bd86b60918e8@leemhuis.info>
 <87bjett3ud.wl-tiwai@suse.de> <7929c116-ff2e-413b-ae73-e7d19e846e0f@harin.net>
 <87v7czrasg.wl-tiwai@suse.de> <trinity-c85da660-f130-434c-a64c-a076180ce5c0-1778158023623@3c-app-mailcom-bs03>
 <87qznnpd2p.wl-tiwai@suse.de> <CAFTm+6Bj_dWdSifUoS7hZ3kfVambXK_=7jyGuHp33RZoSEGVUA@mail.gmail.com>
 <CAFTm+6Dtsc8z7s4Gj+6A9zGpXyj93tQEbkzQLu13S36SmhB8Zw@mail.gmail.com>
In-Reply-To: <CAFTm+6Dtsc8z7s4Gj+6A9zGpXyj93tQEbkzQLu13S36SmhB8Zw@mail.gmail.com>
From: Matt DeVillier <matt.devillier@gmail.com>
Date: Thu, 7 May 2026 10:06:51 -0500
X-Gm-Features: AVHnY4Iv2W0LjPHmazONKfsvVFpbLBme_idkCBKoU-7Lz7R48Lc3QH_beIO1IWQ
Message-ID: <CAFTm+6AXoBGCX1XVua9A=YWbBieeZbVBXQE1Rx5kAf0QiBd55w@mail.gmail.com>
Subject: Re: [regression] ctxfi: no speaker output when headphones connected
 on >=7.0.x
To: Linux Sound System <linux-sound@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 8:24=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 07 May 2026 14:47:03 +0200,
> Dutch Ingraham wrote:
> >
> > > Sent: Thursday, May 07, 2026 at 1:30 AM
> > > From: "Takashi Iwai" <tiwai@suse.de>
> > > To: "Harin Lee" <me@harin.net>
> > > Cc: "Takashi Iwai" <tiwai@suse.de>, "Thorsten Leemhuis" <regressions@=
leemhuis.info>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@s=
use.com>, "Linux kernel regressions list" <regressions@lists.linux.dev>, "L=
inux Sound System" <linux-sound@vger.kernel.org>, "LKML" <linux-kernel@vger=
.kernel.org>, stoa@gmx.us
> > > Subject: Re: [regression] ctxfi: no speaker output when headphones co=
nnected on >=3D7.0.x
> > >
> > > On Thu, 07 May 2026 00:06:11 +0200,
> > > Harin Lee wrote:
> > > >
> > > > On 5/6/26 4:05 PM, Takashi Iwai wrote:
> > > > > On Wed, 06 May 2026 08:24:36 +0200,
> > > > > Thorsten Leemhuis wrote:
> > > > >>
> > > > >> Hi! Just FYI, I noticed a regression report in bugzilla:
> > > > >>
> > > > >> https://bugzilla.kernel.org/show_bug.cgi?id=3D221461
> > > > >>
> > > > >> To quote:
> > > > >>
> > > > >>> Dutch Ingraham 2026-05-03 18:12:49 UTC
> > > > >>>
> > > > >>> Kernels >=3D7.0.1 contain a regression as to Creative Sound Bla=
ster Z SE
> > > > >>> discrete pci sound card, but not integrated. Kernels 7.0.1, 7.0=
.2, and
> > > > >>> 7.0.3 tested; 7.0.0 not tested. Reverting to any 6.18.x or 6.12=
.x does
> > > > >>> not present the issue.
> > > > >>>
> > > > >>> Specifically, using pipewire managed by pavucontrol, on both Ge=
ntoo and
> > > > >>> Arch Linux, when both external speakers and headphones are conn=
ected,
> > > > >>> all sound is routed through the headphones regardless of whethe=
r settings
> > > > >>> are set to Line Out/Speaker or Line Out/Headphones; there is no=
 speaker
> > > > >>> output. If headphones are disconnected, without reboot, speaker=
s work;
> > > > >>> reconnect headphones, without reboot, sound reverts to headphon=
es.
> > > > >>>
> > > > >>> Kernel: 7.0.3, Gentoo compiled from source using olddefconfig o=
n 6.18.24
> > > > >>>               .config; Arch standard release
> > > > >>> 'lspci -nnk | grep -i audio' attached
> > > > >>> 'dmesg | grep -i audio' for 7.0.3 and 6.18.24 attached
> > > > >>> pipewire-1.6.4 on both Gentoo and Arch Linux
> > > > >>> alsa-firmware-1.2.4 on both Gentoo and Arch Linux
> > > > >>> 'cat /proc/sys/kernel/tainted' returns 0 for both Gentoo and Ar=
ch Linux
> > > > >>>
> > > > >>> Processor             :       AMD Ryzen7 5700G
> > > > >>> Motherboard           :       Asus Prime X570-Pro
> > > > >>> RAM                           :       Patriot Viper Steel DDR-4=
 @3200mHz
> > > > >>> Graphics        :   ASRock AMD Radeon RX 7600 Challenger 8GB OC
> > > > >>> Sound Card      :   Creative Sound Blaster Z SE
> > > > >>>
> > > > >>>
> > > > >>> Expected outcome: ability to choose output to either speakers o=
r head-
> > > > >>> phones while both are plugged-in to sound card.
> > > > >>>
> > > > >>> Workaround: none known.
> > > > >>
> > > > >> See the ticket for more details. One of them: 7.1-rc2 is affecte=
d as
> > > > >> well. Reporter is CCed. Forwarded this to ensure this report mak=
es it to
> > > > >> the interested parties, as bugzilla might not have forwarded thi=
s.
> > > > >>
> > > > >> Dutch Ingraham: if nobody within a few days has an idea why this
> > > > >> happens, you will likely have to use a git bisection to get this=
 resolved.
> > > > >
> > > > > As there have been many significant changes in ctxfi since 6.18, =
it's
> > > > > hard to tell what broke.  Please go git bisect.
> > > > >
> > > > >
> > > > > thanks,
> > > > >
> > > > > Takashi
> > > > >
> > > >
> > > > Creative Sound Blaster Z-series uses the snd_hda_codec_ca0132 drive=
r,
> > > > not snd_ctxfi. The dmesg logs in the bugzilla shows only ca0132
> > > > entries.
> > >
> > > Ah, sorry, then it's easier.  The only major change is the
> > > commit 778031e1658d206a52bf9491c91ae5d4f4a2509d
> > >     ALSA: hda/ca0132: Set HP/Speaker auto-detect default from headpho=
ne pin verb
> > >
> > > Try to revert this one.
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > >
> >
> > I can confirm this seems like a good candidate. I built and tested 6.19=
.14
> > and 7.0. On 6.19.14, speakers work as expected; on 7.0, speakers are no=
t
> > working as expected and the offending patch is included in the 7.0 patc=
hset.
> >
> > Thank you all for your work on this issue.
>
> OK, then let's put Matt to the party.
> Matt, could you help for debugging the regression?
>
>
> Takashi


I can confirm the regression here on my 2013 Chromebook Pixel w/CA0132.

Looking more closely, the issue is that tVNID_HP_ASEL and VNID_HP_SEL are
mutually exclusive selection sources in ca0132_select_out() /
ca0132_alt_select_out(),
and auto-detect always "wins." So, enabling auto-detect effectively
disabled user
override.

While reverting would fix this problem, it would reintroduce the
problem of jack-detect being
ignored completely. A better solution would be to default to
auto-detect, but allow manual selection
to override. Here's a quick patch I whipped up that should resolve the
issue (untested though):
---
From: Matt DeVillier <matt.devillier@gmail.com>
Date: Thu, 7 May 2026 09:58:41 -0500
Subject: [PATCH] ALSA: hda/ca0132: Disable auto-detect on manual output sel=
ect

Commit 778031e1658d ("ALSA: hda/ca0132: Set HP/Speaker
auto-detect default from headphone pin verb") enables HP/Speaker
auto-detect by default when the headphone pin supports presence detect.

With auto-detect enabled, ca0132_select_out() and ca0132_alt_select_out()
choose the output from jack presence instead of the manual HP/Speaker
selection. This means selecting speaker output while headphones are
plugged in updates the control state, but audio still routes to the
headphones.

Treat an explicit manual output selection as a request to leave
auto-detect mode. Clear the HP/Speaker auto-detect switch before applying
the manual selection, and notify userspace so the auto-detect control
state is updated in mixers. Do this for both the normal HP/Speaker
Playback Switch and the alternate Output Select control used by desktop
cards.

This keeps auto-detect enabled by default for devices with jack presence
detection, while preserving the expected behavior that a manual output
choice takes effect immediately.

Fixes: 778031e1658d ("ALSA: hda/ca0132: Set HP/Speaker auto-detect
default from headphone pin verb")
Signed-off-by: Matt DeVillier <matt.devillier@gmail.com>
---
 sound/hda/codecs/ca0132.c | 44 +++++++++++++++++++++++++++++++------------=
-
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
index ad533b04ab29..be565ffaade0 100644
--- a/sound/hda/codecs/ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -5498,6 +5498,30 @@ static int zxr_headphone_gain_set(struct
hda_codec *codec, long val)
  return 0;
 }

+/*
+ * Manual output selection (HP/Speaker Playback Switch or alt Output Selec=
t)
+ * is meaningful only when HP/Speaker auto-detect is disabled, since the
+ * select_out path always prefers jack presence when auto-detect is on. Wh=
en
+ * the user explicitly chooses an output, turn auto-detect off so the manu=
al
+ * choice actually takes effect, and notify userspace so the auto-detect
+ * control reflects the new state.
+ */
+static void ca0132_disable_hp_auto_detect(struct hda_codec *codec)
+{
+ struct ca0132_spec *spec =3D codec->spec;
+ struct snd_kcontrol *kctl;
+
+ if (!spec->vnode_lswitch[VNID_HP_ASEL - VNODE_START_NID])
+ return;
+
+ spec->vnode_lswitch[VNID_HP_ASEL - VNODE_START_NID] =3D 0;
+ kctl =3D snd_hda_find_mixer_ctl(codec,
+      "HP/Speaker Auto Detect Playback Switch");
+ if (kctl)
+ snd_ctl_notify(codec->card, SNDRV_CTL_EVENT_MASK_VALUE,
+       &kctl->id);
+}
+
 static int ca0132_vnode_switch_set(struct snd_kcontrol *kcontrol,
  struct snd_ctl_elem_value *ucontrol)
 {
@@ -5510,14 +5534,11 @@ static int ca0132_vnode_switch_set(struct
snd_kcontrol *kcontrol,
  int auto_jack;

  if (nid =3D=3D VNID_HP_SEL) {
- auto_jack =3D
- spec->vnode_lswitch[VNID_HP_ASEL - VNODE_START_NID];
- if (!auto_jack) {
- if (ca0132_use_alt_functions(spec))
- ca0132_alt_select_out(codec);
- else
- ca0132_select_out(codec);
- }
+ ca0132_disable_hp_auto_detect(codec);
+ if (ca0132_use_alt_functions(spec))
+ ca0132_alt_select_out(codec);
+ else
+ ca0132_select_out(codec);
  return 1;
  }

@@ -5978,7 +5999,6 @@ static int ca0132_alt_output_select_put(struct
snd_kcontrol *kcontrol,
  struct ca0132_spec *spec =3D codec->spec;
  int sel =3D ucontrol->value.enumerated.item[0];
  unsigned int items =3D NUM_OF_OUTPUTS;
- unsigned int auto_jack;

  if (sel >=3D items)
  return 0;
@@ -5988,10 +6008,8 @@ static int ca0132_alt_output_select_put(struct
snd_kcontrol *kcontrol,

  spec->out_enum_val =3D sel;

- auto_jack =3D spec->vnode_lswitch[VNID_HP_ASEL - VNODE_START_NID];
-
- if (!auto_jack)
- ca0132_alt_select_out(codec);
+ ca0132_disable_hp_auto_detect(codec);
+ ca0132_alt_select_out(codec);

  return 1;
 }
--
2.51.0
