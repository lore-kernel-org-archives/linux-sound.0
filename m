Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AA6AD2F
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 02:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736132145; cv=none; b=SnGpMCp1MzsY+IYSvgfxjYL2xXt0qRrI4azzy7eZADjH62XQmS1o2b+dtlxTKkvbgru3ZWHX0YwRiT9DmtmydDG5YfH4Fccu7SihY4YjPl7cVKAgCWAEWPhj13L9BgvsZPYBwkxlm3UQIijob9g5EKEDZ9XsAHXWUa7xTL/ib3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736132145; c=relaxed/simple;
	bh=9+rNd4GnktSvQ5YfLp0lN8JxjV3RkuRsCIBVHshaPZQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=u1gK+gkfQfzew1oeFHxRf1hNPPMNJim8bYzP+DxBMooKyM1E0hT64zp6wSJFdtntHr/q8Qsm0W6lZR1fVBgsyc3RjASYkBxYweuQvTutx0u2T1yd9GKSH2uhmcNLsv/UTEiJrKV1T+Va+6WoanhfkxN1F99xkTa+ntx93EuKNUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn; spf=pass smtp.mailfrom=m.fudan.edu.cn; dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b=MwPuCvm3; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b="MwPuCvm3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m.fudan.edu.cn;
	s=sorc2401; t=1736132126;
	bh=g5Pp92dV07PMfsJI6uFzE38mRrPBxJoksgkpbRdnSRM=;
	h=Mime-Version:Subject:From:Date:Message-Id:To;
	b=MwPuCvm39st5TVFIAhsGtDYoYM9FSueF3RLOV+LUOije6Z0D34dgpEOoNr7NAzbbW
	 efB4IMaalkdbGf8tTFo0R68NZkw5QpJJrodm/eq2fzS+yFe7b5dLnyOcXx4uQ6pQ+V
	 Jy8qjN2R5GXXUGF12keEVpPWjIaEIDyRElu0vx8I=
X-QQ-mid: bizesmtpsz2t1736132125t6djerj
X-QQ-Originating-IP: fKPjvtj5dzjFJWsafoeSVzkvlLbD2FbLzWKa2GKLjvI=
Received: from smtpclient.apple ( [202.120.235.227])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 06 Jan 2025 10:55:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16345235143239477543
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH] ALSA: seq: oss: Send fragmented SysEx messages
 immediately
From: Kun Hu <huk23@m.fudan.edu.cn>
In-Reply-To: <20241231115523.15796-1-tiwai@suse.de>
Date: Mon, 6 Jan 2025 10:55:13 +0800
Cc: linux-sound@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <EC84D88D-CC77-4FAA-9B86-7BBA0BAAF9BB@m.fudan.edu.cn>
References: <20241231115523.15796-1-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:m.fudan.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NMGzQWUSIfvTbTqBEpzkIvKePJtcZVca5ku1ayvT6eOAktrtofM/HloE
	hKkcTnnuSjFCGpc1A5HsQHrqrDutuhQ+GGbcc1pKXQtqNePECX1jHg1uh2Jspu/c2B1edzf
	ZwjzY1YX3AWSNCxWgLEt+FJ91bh3tcJ4BG1RUBccrh5T+xWpbnuBZuMISRJ2ZB482UewQXc
	DD9HWs02TXFTCvAFkB3T/6Q34tGdUnTDFLL/D0+QPv9p6pg80FVjIqh9n4tfJLQ20NxLf6a
	Ic5Z9s0goFXFGBzLa0Z9xpdhbW0gLX+FJhDDzTG0gHmeYljNf4Y0gf2haObvxB5pjpscapW
	sIz+mlLvz3e3YjR/yn7irxwLxtmXQH3ASqP7l0X09XZcI/3hsQIvY0Z6betDa0nU+SPRy7A
	zQBXbcGgXaKzfpOZfdgtlClMqOVfVtdP6YhmZTofFgsqoKHsMMsLn0NGA8el7yCiC2kEf/A
	/MZkZRaUSDX2ZaLtQVLmPhERkC5qxV1raoVWT3Q2hgOIjzltYSOe7Hg33+g0x0kDRdXnXU3
	8ShrjhgozXLxEcZhg1uyLwGGbHJYVG/H6DGEpi/gZwlrQcDydkwOSHCiNFq5gVv0H5aF9e3
	l6X38eSfeA6ql+VS1CPGVZot9l67YL8xhtk8rCCHDbCVVUY5xBSGglove3friiVmiG6HwEe
	SWvUp+P5eLGJjx20bZeuWlrFBZf6bxQpoFG08taHOhECZl/G7sov92/8nrAAcN9xwilHEth
	VmFRy1J/0iYhYFEDWrRDFFZYRAIc+h18A6ledmL4ku2wkDtUz5ddkyJbMU91skvFxpLJyGL
	zK7XggP9n1XXwFtbPIAyQOnGYpFikbD1wwCng0cpkOeUrWqY1rPbgGmHS+cYKFTSO26CLlp
	JMt51KjMtTYqle8FLYOg2p4p7XwMl1OPsRce7TdTkvuflVtLJIgvY7SzjYK9+fFt/sivG9p
	uNV4x1Y6OvliYmKIbP33+v0/YICAxzKwTXZcg4VbFcOVQ1bqLrslcXkYh
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0



> 2024=E5=B9=B412=E6=9C=8831=E6=97=A5 19:55=EF=BC=8CTakashi Iwai =
<tiwai@suse.de> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> The recent bug report spotted on the old OSS sequencer code that tries
> to combine incoming SysEx messages to a single sequencer event.  This
> is good, per se, but it has more demerits:
>=20
> - The sysex message delivery is delayed until the very last event
> - The use of internal buffer forced the serialization
>=20
> The recent fix in commit 0179488ca992 ("ALSA: seq: oss: Fix races at
> processing SysEx messages") addressed the latter, but a better fix is
> to handle the sysex messages immediately, i.e. just send each incoming
> fragmented sysex message as is.  And this patch implements that.
> This resulted in a significant cleanup as well.
>=20
> Note that the only caller of snd_seq_oss_synth_sysex() is
> snd_seq_oss_process_event(), and all its callers dispatch the event
> immediately, so we can just put the passed buffer pointer to the event
> record to be handled.
>=20
> Reported-and-tested-by: Kun Hu <huk23@m.fudan.edu.cn>
> Link: =
https://lore.kernel.org/2B7E93E4-B13A-4AE4-8E87-306A8EE9BBB7@m.fudan.edu.c=
n
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
> sound/core/seq/oss/seq_oss_device.h |  1 -
> sound/core/seq/oss/seq_oss_synth.c  | 80 +++++------------------------
> 2 files changed, 14 insertions(+), 67 deletions(-)
>=20
> diff --git a/sound/core/seq/oss/seq_oss_device.h =
b/sound/core/seq/oss/seq_oss_device.h
> index 98dd20b42976..c0b1cce127a3 100644
> --- a/sound/core/seq/oss/seq_oss_device.h
> +++ b/sound/core/seq/oss/seq_oss_device.h
> @@ -55,7 +55,6 @@ struct seq_oss_chinfo {
> struct seq_oss_synthinfo {
> struct snd_seq_oss_arg arg;
> struct seq_oss_chinfo *ch;
> - struct seq_oss_synth_sysex *sysex;
> int nr_voices;
> int opened;
> int is_midi;
> diff --git a/sound/core/seq/oss/seq_oss_synth.c =
b/sound/core/seq/oss/seq_oss_synth.c
> index 51ee4c00a843..02a90c960992 100644
> --- a/sound/core/seq/oss/seq_oss_synth.c
> +++ b/sound/core/seq/oss/seq_oss_synth.c
> @@ -26,13 +26,6 @@
>  * definition of synth info records
>  */
>=20
> -/* sysex buffer */
> -struct seq_oss_synth_sysex {
> - int len;
> - int skip;
> - unsigned char buf[MAX_SYSEX_BUFLEN];
> -};
> -
> /* synth info */
> struct seq_oss_synth {
> int seq_device;
> @@ -66,7 +59,6 @@ static struct seq_oss_synth midi_synth_dev =3D {
> };
>=20
> static DEFINE_SPINLOCK(register_lock);
> -static DEFINE_MUTEX(sysex_mutex);
>=20
> /*
>  * prototypes
> @@ -319,8 +311,6 @@ snd_seq_oss_synth_cleanup(struct seq_oss_devinfo =
*dp)
> }
> snd_use_lock_free(&rec->use_lock);
> }
> - kfree(info->sysex);
> - info->sysex =3D NULL;
> kfree(info->ch);
> info->ch =3D NULL;
> }
> @@ -396,8 +386,6 @@ snd_seq_oss_synth_reset(struct seq_oss_devinfo =
*dp, int dev)
> info =3D get_synthinfo_nospec(dp, dev);
> if (!info || !info->opened)
> return;
> - if (info->sysex)
> - info->sysex->len =3D 0; /* reset sysex */
> reset_channels(info);
> if (info->is_midi) {
> if (midi_synth_dev.opened <=3D 0)
> @@ -409,8 +397,6 @@ snd_seq_oss_synth_reset(struct seq_oss_devinfo =
*dp, int dev)
>  dp->file_mode) < 0) {
> midi_synth_dev.opened--;
> info->opened =3D 0;
> - kfree(info->sysex);
> - info->sysex =3D NULL;
> kfree(info->ch);
> info->ch =3D NULL;
> }
> @@ -483,64 +469,26 @@ snd_seq_oss_synth_info(struct seq_oss_devinfo =
*dp, int dev)
>=20
> /*
>  * receive OSS 6 byte sysex packet:
> - * the full sysex message will be sent if it reaches to the end of =
data
> - * (0xff).
> + * the event is filled and prepared for sending immediately
> + * (i.e. sysex messages are fragmented)
>  */
> int
> snd_seq_oss_synth_sysex(struct seq_oss_devinfo *dp, int dev, unsigned =
char *buf, struct snd_seq_event *ev)
> {
> - int i, send;
> - unsigned char *dest;
> - struct seq_oss_synth_sysex *sysex;
> - struct seq_oss_synthinfo *info;
> + unsigned char *p;
> + int len =3D 6;
>=20
> - info =3D snd_seq_oss_synth_info(dp, dev);
> - if (!info)
> - return -ENXIO;
> + p =3D memchr(buf, 0xff, 6);
> + if (p)
> + len =3D p - buf + 1;
>=20
> - guard(mutex)(&sysex_mutex);
> - sysex =3D info->sysex;
> - if (sysex =3D=3D NULL) {
> - sysex =3D kzalloc(sizeof(*sysex), GFP_KERNEL);
> - if (sysex =3D=3D NULL)
> - return -ENOMEM;
> - info->sysex =3D sysex;
> - }
> -
> - send =3D 0;
> - dest =3D sysex->buf + sysex->len;
> - /* copy 6 byte packet to the buffer */
> - for (i =3D 0; i < 6; i++) {
> - if (buf[i] =3D=3D 0xff) {
> - send =3D 1;
> - break;
> - }
> - dest[i] =3D buf[i];
> - sysex->len++;
> - if (sysex->len >=3D MAX_SYSEX_BUFLEN) {
> - sysex->len =3D 0;
> - sysex->skip =3D 1;
> - break;
> - }
> - }
> -
> - if (sysex->len && send) {
> - if (sysex->skip) {
> - sysex->skip =3D 0;
> - sysex->len =3D 0;
> - return -EINVAL; /* skip */
> - }
> - /* copy the data to event record and send it */
> - ev->flags =3D SNDRV_SEQ_EVENT_LENGTH_VARIABLE;
> - if (snd_seq_oss_synth_addr(dp, dev, ev))
> - return -EINVAL;
> - ev->data.ext.len =3D sysex->len;
> - ev->data.ext.ptr =3D sysex->buf;
> - sysex->len =3D 0;
> - return 0;
> - }
> -
> - return -EINVAL; /* skip */
> + /* copy the data to event record and send it */
> + if (snd_seq_oss_synth_addr(dp, dev, ev))
> + return -EINVAL;
> + ev->flags =3D SNDRV_SEQ_EVENT_LENGTH_VARIABLE;
> + ev->data.ext.len =3D len;
> + ev->data.ext.ptr =3D buf;
> + return 0;
> }
>=20
> /*
> --=20
> 2.43.0
>=20
>=20


Hi Takashi Iwai,
I noticed that in your previous modifications, you seemed to have made =
lots of changes to the related structures, along with many updates to =
the snd_seq_oss_synth_sysex function. However, in the latest kernel =
tree, it seems that only a mutex lock has been added to this function.
While this certainly resolves the issue, I=E2=80=99m personally curious =
to understand the reasoning behind this approach. Was there a specific =
consideration or constraint that led to this simplified solution?

=E2=80=94=E2=80=94
Thankx
Kun hu

