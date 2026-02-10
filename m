Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6356F33343F
	for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 07:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770707942; cv=pass; b=PWkguB+Xbekpkv4+48w9AKo8HWT75NdWcUf2sAzzO0CYXa6jjuEgLOEfdYue/r2sD4xgKn9+gLHLEnW0+LxdHf4/PH8nu3OYLUfQtBMi9wpGfyJIkVMO8rWprkZxLhajEgBM9jsUH3e4OURStsr2VFSuuUksJ4NXKs8SvRM6/00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770707942; c=relaxed/simple;
	bh=MwZ2lkVillUybxEY1cC/HwW6MsPjMsur1kBiv1yRowE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NL+ZlQ5D15Sjq4YGlxHuSm3mv8tmM70UbRty33CCusxkwL7Vq/BeYoSbciZvuWkrHlStINnxarGBnKqKPv9WuCh3dKTboQQ7pVSZCEoialLY3dtGyd78kQi77V2bZxdtzSc+oEf7yJ8gnvCVe1SNlgtr36NVmTZnyThM5XOxPwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=BdKDE+ny; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="BdKDE+ny"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=pabMGLGGXLOcOo/Dpjkxu/cClFC72VFL87C8/t2PX84=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770707919;
 b=F9jVLY/PhiAzH2BOW3dbCPGRrC6zN74V3tUeWh6fjkemhRzijBoGsOIOGdDAeqHB8HIfPqCf
 NQhA6oDREX2ayWHXwiZs4CpF2qSIIdmWt2OuJogd2i8P17A7UqcUYXJ+w2Smvuk33XSq76cfGgm
 V+zhHhR+f6x376LAIT/v8q+cI6axSzrC/bzSn2lDlmp7ti04TKPcMxzyZeMBDnf0djvgx3owQqj
 uqwnnl53SFuoF5w2SzyWsSfztF+tMccrmpSpMedSY8uVWbQchxltUOlhOqdgUQ2Go34R3WGMz8a
 1KOzNFzsipWCgH3adqBba+WgO67vYfqRfsXtvSd3FAt3A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770707919;
 b=M8cGCf0fFXU4965MIcv2sbwvTLheB9uz9Dun7+oQgFf0HvKDu0HIBw4XRh8cfDdX2wGD7NAB
 cv1Frs3/lM0UOzOUTaXQQO5VAeAbGERKZpt7L2r0HHfi35dIwP0GL9j3p4xQ974wO6WpUK2SsNJ
 xW/7ZjWk0CybgEbKB0P5EMZ6v7eo48B3gdNAGFub6nKQUu1b9xDGjdYJ9lKt8kkwTd07jocAmZE
 36o+Y4j7BM8cn+O5tL5dE9bpKFCVfUvEROkKKOfR+dnMWlMQ2ozET8Pps204dw0Kf+ODzNyA7gL
 7uF2PYwSqfKdjLzSeNQkmf/SbDGCzUcGOd7Ce1SdjrYvw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Tue, 10 Feb 2026 08:18:39 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 59A1B5A3119;
	Tue, 10 Feb 2026 08:18:27 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: Re: [PATCH] ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()
Date: Tue, 10 Feb 2026 08:18:26 +0100
Message-ID: <5056506.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260202174112.2018402-1-n7l8m4@u.northwestern.edu>
References: <20260202174112.2018402-1-n7l8m4@u.northwestern.edu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-sound@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4f9Cb80s0Mz3ybFB
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:f91bf45b2c1e1e4dad7653f0d57fe9b6
X-cloud-security:scantime:2.062
DKIM-Signature: a=rsa-sha256;
 bh=pabMGLGGXLOcOo/Dpjkxu/cClFC72VFL87C8/t2PX84=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770707918; v=1;
 b=BdKDE+nyqU2cQ2rkz3FT+n8IjpygTxe8ZAb6u5pZ2i7S0zdKSpgvEZszgoMGWYDavVr6qmD/
 poNcG7wTq2w8K+FbOH3qpH4qqwgUmw3vwSVaXB9n5PisRcrrWZ274/A4l+JpV35PU8LrLA+bJuQ
 c/rURd5G3bPcDzzdDIx7gka+ExO9XPFXpwFlD4Yt8+H2JEyGwtjFvU3BIZ/9wBqu6dJ0DO0bRIi
 DzL2v95q5ohS/qBECEJHdmzgCfLGnnX5/oKOjqqBWYHPUZcKddXyuQXj2/q/nK4rVQSWMyvBa+3
 O+v83taB6G/Hxniq3zMFo9hjad8mRf4FFrEgxOSUeWPsg==

Hi,

Am Montag, 2. Februar 2026, 18:41:12 CET schrieb Ziyi Guo:
> fsl_xcvr_activate_ctl() has=20
> lockdep_assert_held(&card->snd_card->controls_rwsem),
> but fsl_xcvr_mode_put() calls it without acquiring this lock.
>=20
> Other callers of fsl_xcvr_activate_ctl() in fsl_xcvr_startup() and
> fsl_xcvr_shutdown() properly acquire the lock with down_read()/up_read().
>=20
> Add the missing down_read()/up_read() calls around fsl_xcvr_activate_ctl()
> in fsl_xcvr_mode_put() to fix the lockdep assertion and prevent potential
> race conditions when multiple userspace threads access the control.
>=20
> Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
> ---
>  sound/soc/fsl/fsl_xcvr.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index a268fb81a2f8..0b9dd64b9a82 100644
> --- a/sound/soc/fsl/fsl_xcvr.c
> +++ b/sound/soc/fsl/fsl_xcvr.c
> @@ -223,10 +223,13 @@ static int fsl_xcvr_mode_put(struct snd_kcontrol *k=
control,
> =20
>  	xcvr->mode =3D snd_soc_enum_item_to_val(e, item[0]);
> =20
> +	down_read(&card->snd_card->controls_rwsem);

This lock causes a blocked task on my TQMa8MPxL based board:

INFO: task alsactl:1969 blocked for more than 120 seconds.
      Tainted: G        W           6.19.0-next-20260209+ #3331
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:alsactl         state:D stack:0     pid:1969  tgid:1969  ppid:1      t=
ask_flags:0x400100 flags:0x00000a01
Call trace:
 __switch_to+0xdc/0x120 (T)
 __schedule+0x258/0x790
 schedule+0x30/0xb0
 schedule_preempt_disabled+0x20/0x40
 rwsem_down_read_slowpath+0x214/0x68c
 down_read+0xb0/0xb8
 fsl_xcvr_mode_put+0x4c/0xc0 [snd_soc_fsl_xcvr ac1b31380c6a6ea0d613bd5f7848=
9e314a40f91f]
 snd_ctl_elem_write+0xdc/0x180 [snd 852e63996474051c57bcd1a86ebfd8108307385=
3]
 snd_ctl_ioctl+0x7a4/0xaec [snd 852e63996474051c57bcd1a86ebfd81083073853]
 __arm64_sys_ioctl+0x9c/0xe4
 invoke_syscall.constprop.0+0x58/0xcc
 el0_svc_common.constprop.0+0xac/0xd4
 do_el0_svc+0x18/0x20
 el0_svc+0x24/0xa0
 el0t_64_sync_handler+0x98/0xdc
 el0t_64_sync+0x154/0x158
INFO: task alsactl:1969 <reader> blocked on an rw-semaphore likely owned by=
 task alsactl:1969 <writer>

Best regards,
Alexander

>  	fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name,
>  			      (xcvr->mode =3D=3D FSL_XCVR_MODE_ARC));
>  	fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name,
>  			      (xcvr->mode =3D=3D FSL_XCVR_MODE_EARC));
> +	up_read(&card->snd_card->controls_rwsem);
> +
>  	/* Allow playback for SPDIF only */
>  	rtd =3D snd_soc_get_pcm_runtime(card, card->dai_link);
>  	rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream_count =3D
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


