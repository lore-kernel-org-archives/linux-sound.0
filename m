Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3272370;
	Mon, 30 Dec 2024 13:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735564275; cv=none; b=t+tvvzuSC4rMsMYtZlLY9MqWprSoO/9jiRzW+6rJ33lkQnMKfz/7Qejco/IGi5jOZ9zNYIXzvDXK58uXxq0O+SsEF5uCvn63SxTXxzXUROXknVxwWQOaWHP8llLpoaTToyjvPi/98CPx8nC2Ht48W//FqKYD74yZK0L7J1/YWXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735564275; c=relaxed/simple;
	bh=5104Cnr2zC4fZoCOYxLVCaeqMk304hY247xR9PuTQBk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=s3doMjvcDs+067gC70qAaNbaYRzjfM04RmF/QG9oi8+NlLSumtTViUVgayZFSD35JMbu5zvwLNFxRcnwtcqCfdZN7q+SD9tfZcP7JWOnSWe6KFHUUd82G18AIJSHVvGf4RsUHHjTsdzjEnt12rULFjtIqS40xf/MtlmNE4LclhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn; spf=pass smtp.mailfrom=m.fudan.edu.cn; dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b=X8qPL3lE; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b="X8qPL3lE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m.fudan.edu.cn;
	s=sorc2401; t=1735564237;
	bh=FCceDx/eBc841ylqZkebjdZgHnvUh9yuO4ffSZIBnNI=;
	h=Mime-Version:Subject:From:Date:Message-Id:To;
	b=X8qPL3lETTNrmN7aEI1eZoy/0S9YTfFMPTIAqwvUuMLJDfSpqOiy3il4CD+Y1EwiQ
	 +fFAEZMdhco7EDZqFo9dOWm9iyxpMMKm9CENAyJpsOV64SicDLMXefZEKU573EuMiR
	 M/ygxBGChzzJvXqt1DkqD49krFl/r0gif7ey1k+4=
X-QQ-mid: bizesmtp81t1735564236tymekbs1
X-QQ-Originating-IP: yHqpmC/J7LA1Ci9sJX6Q+cijMJZkIIMTkkQWhkdLE0M=
Received: from smtpclient.apple ( [202.120.235.236])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 30 Dec 2024 21:10:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9625823018409251600
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: Bug: slab-out-of-bounds in snd_seq_oss_synth_sysex
From: Kun Hu <huk23@m.fudan.edu.cn>
In-Reply-To: <87pll9wi4x.wl-tiwai@suse.de>
Date: Mon, 30 Dec 2024 21:10:24 +0800
Cc: perex@perex.cz,
 tiwai@suse.com,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "jjtan24@m.fudan.edu.cn" <jjtan24@m.fudan.edu.cn>
Content-Transfer-Encoding: quoted-printable
Message-Id: <182E26F6-E0BC-44D3-A0E7-124C81B7F8EB@m.fudan.edu.cn>
References: <2B7E93E4-B13A-4AE4-8E87-306A8EE9BBB7@m.fudan.edu.cn>
 <B1CA9370-9EFE-4854-B8F7-435E0B9276C6@m.fudan.edu.cn>
 <87ed1qydgi.wl-tiwai@suse.de>
 <3326E7C2-1E4F-4F57-AAB5-065C20854F31@m.fudan.edu.cn>
 <87pll9wi4x.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:m.fudan.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NyPaQtJYQgeopbZCrUJnaFJNAZpOD3uJIRZspRXrFnfXtDgzMBQa+N10
	0ZWTa/0IS07KMCPQwTgGjjw1G6pjH13F0+lpJoLaF6aY/o8Gtv16Vy8MamPVYk9jHgA+jdD
	D0S0fbq4nRp+CXLYCPSm1MDCZGkEOw/F9KcgliBZbX/cUqlLvnv91jN1NtTtXjciFCuR+NR
	s7j2UZXxCVk8exunPeBOHDzbiynDwgdzQimcGEVXvmqkoE6Fi4Ji9X1LmIl8513R37ZXtzt
	5Oj/x+nghUdJX+kJv0wY2csQ8IyLzykbYtam/oxjuS6JLCABWpoNW36mGajkDE7W3/XHVVR
	Kb5bTSZjrDJi/4BkG5VmLDlV4N6CrxCW9iLN0CfNsIGNAnYrhi64Tnul/DlvBQlj++QHMz7
	ePDMSbU4fC9npLLaEJpu0cBI+CKmroBPRo7SO0OpBHsPlSg3tUcfsfFOoJMdtBE/lzYPjgP
	Ps3C5/L73Zg+1z1DxkmUVGmloSSuBdNoCcVIYfVffgjhWfxempBg8y+t0vlx4ej3qPSdzNB
	bpv2TxmRbHAJNQbvHGh0TA8/7O2oaOmdw+4vHDxBXx4Ed1fOtUsHg4Xj6ZFcz3iJY2MMYLM
	pMOsgxh0QTipGZMiDzM3gpyjK02s2B9USXnYXlGzvpcRJ4lbgC4bdI3MmcN5kb4TeAsgIzY
	N18bbOQcpYQkrHeP9+GGVNoJedgE5UBwnyNeeBOc3B0uHZji0wljJpIEsfYGhv1edBI1JbM
	C7pOKYFE4/J2WuOMb23kJr2T0xD1poAErYf2O+T3Q1j01N9BzthYR2nsYzpZO7B2Vfa500B
	XBQYvFoj09xF8/9GPe4xN8liyU7tlmrwa9IRAa2A1TF3zFncRwPufvjemOxCBPeUgTIl5Rp
	944Y+by+IG0HsdajXEUQxn7QjPbjppAisqBYLpTuqwfSWGwR5pk+JxF64Sa9IVPdxygqj/n
	f1ClTtcXAemU2OCqqCFEVk74idGKpLZVIPytiGmn+KQ0IaC3kHrgzwW90bzET9KQRih0=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0


>=20
> Good to hear.  Then I'm going to submit this as a band-aid fix; this
> is simple and easy to backport to older stable releases, too.
>=20
> Meanwhile, we may have a different fix for the long term.  Essentially
> the sysex handling in OSS layer is unnecessarily complex, and we can
> send a packet immediately at each time instead of combining them.
>=20
> Could you try the patch below instead of the previous one?
>=20
>=20
> thanks,
>=20
> Takashi
>=20
> -- 8< --
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
> index e3394919daa0..02a90c960992 100644
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
> @@ -318,8 +311,6 @@ snd_seq_oss_synth_cleanup(struct seq_oss_devinfo =
*dp)
> }
> snd_use_lock_free(&rec->use_lock);
> }
> - kfree(info->sysex);
> - info->sysex =3D NULL;
> kfree(info->ch);
> info->ch =3D NULL;
> }
> @@ -395,8 +386,6 @@ snd_seq_oss_synth_reset(struct seq_oss_devinfo =
*dp, int dev)
> info =3D get_synthinfo_nospec(dp, dev);
> if (!info || !info->opened)
> return;
> - if (info->sysex)
> - info->sysex->len =3D 0; /* reset sysex */
> reset_channels(info);
> if (info->is_midi) {
> if (midi_synth_dev.opened <=3D 0)
> @@ -408,8 +397,6 @@ snd_seq_oss_synth_reset(struct seq_oss_devinfo =
*dp, int dev)
>   dp->file_mode) < 0) {
> midi_synth_dev.opened--;
> info->opened =3D 0;
> - kfree(info->sysex);
> - info->sysex =3D NULL;
> kfree(info->ch);
> info->ch =3D NULL;
> }
> @@ -482,63 +469,26 @@ snd_seq_oss_synth_info(struct seq_oss_devinfo =
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

Hi,

Regarding your changes, I=E2=80=99ve conducted multiple rounds of race =
condition testing using the same method. The original issue, caused by =
competition for shared resources, could consistently reproduce an =
out-of-bounds error in just a few attempts. The temporary band-aid fix =
and the latest changes have been tested at least 10,000 times, and no =
issues have occurred so far.

=E2=80=94=E2=80=94
Thanks,
Kun Hu

