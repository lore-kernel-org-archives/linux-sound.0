Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830A139A7EF;
	Mon,  3 Aug 2026 06:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785739136; cv=none; b=nUrlJMQQirzZTAZmAmwBRHmEpmGZAasgN8G9G58BsOitEwh+z4z6KWSG/JiB7NExltEgg951uJ3f09IAsy7/iJlr8Jpvxs/ws0fMc5PmhmdIkzgDvklYZ271zZpnEsnZLGKEkyiBqcW+0fSXc8NkkOIcghqCe5kuj6Tts4AamJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785739136; c=relaxed/simple;
	bh=q35bOU8mh36hFOFvLRmtEm/JGsq1F+dnyd20DlJQLtg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=pbYJESEsKkG8d7ND7opJtJDP89X+ff9WHZUrr2C6sGL9r/wcBGQx1lLreaZEPBTcqVK9yZB0/Tb+4p44dVorA/cuSaivjjvBLm+/lDVmINApgsC9QDLhWfCdDaK0ENKPb3/7E7Gl/iOCAboCygADCSIdQAcnPe9BgrbQ/XNsiZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=BLdZw6Gk; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="BLdZw6Gk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785739122;
	bh=Cyf/k/y8sYcnNGGfb5GcBuEuO/FaLLsXj8kGmuu9NXg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=BLdZw6GkKPttdnD6YfiM52KopBX+cfiEmd98a8bGxb9dZ7CqMs4OARnCye4X1kTBr
	 DgH4mypfTORrc8OzilwrRhlcdyJpiXnBzoS7dAyKYtxEHuMvnE6x9VdVgyEcegu3Kf
	 oeep0L2JCj9ABlXdUDPM5XJJuk9cPFnknToDg72I=
X-QQ-mid: zesmtpgz6t1785739117ta0f49f04
X-QQ-Originating-IP: kyQ/fgpCqoV7CFbJ4ul1NfqxMDWHXTEhy1TPJdL1y5U=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Aug 2026 14:38:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3503827160041228308
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=a949f4f959a9e9c73ede8a4278dba00f3ef3605053293f1a8c4444af32a1;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 02 Aug 2026 23:38:33 -0700
Message-Id: <DKF3ONLMSCC7.23CTHB22RU044@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Goko Mell"
 <goku.sonxin626@gmail.com>, "Jinmei Wei" <weijinmei@linux.spacemit.com>,
 "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] ASoC: spacemit: init *dp to NULL before error paths
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Bui Duc Phuc" <phucduc.bui@gmail.com>, "Yixun Lan" <dlan@kernel.org>,
 "Takashi Iwai" <tiwai@suse.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Liam Girdwood" <lgirdwood@gmail.com>
In-Reply-To: <CAABR9nG=s78=5_tGSieN7hdCQOMNzJKdzJo5cx2bMfgAvJM+aw@mail.gmail.com>
References: <20260731101539.36290-1-phucduc.bui@gmail.com>
	<20260731101539.36290-2-phucduc.bui@gmail.com>
	<DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com>
	<CAABR9nEqZG1Vywb2CkoLVgqoLVPKqfYt01t3dF=WTu9qJSS=bw@mail.gmail.com>
	<CAABR9nG=s78=5_tGSieN7hdCQOMNzJKdzJo5cx2bMfgAvJM+aw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MuUXDqQetHVqT6U9HwP+7PVW+6BRdBxuGhP6ePJR3dVLUdUWPkbUWFB4
	HDUlfC46/RntD/FrlFP6FC6pFrQ7P2VVhtjrChMbxBJzhLW9khdTYWCAGliYhvTqNmrsIJi
	xzbbFW2NSo5p61htLFLoPeG4imgqD/TLeXOyOQqpNZqf8Sbq9pGrCECg2Sdoka1dYP8O4Tp
	B0z3YUMbxz1hnaLfA5g8tubzNhb0fucn/9Oz2g8qaRHNj5PuBiZ/LUZWVCG/tSZdKzVAglr
	//2dIXxD/RdVvU9NixfRFuf2sMbMNvqpuvYgVPo2oCARIMpksBNCcYHoLorXDDHYm8eRD9U
	QWSFVn1mkr3f5Fe7EyGWk3nwRcjPJ3xCbch1YgR7Czgs5QSetwziYFAuSC1YX3n6qBlKd33
	8fYUojSvAWMoAnA20dyqj4l9mmb0bWgh2+SpMRsArX6h4XcqMOgtUs+z5PwwP/bsjiIM3bk
	e4yolQgW7EJZFGjd3imLY3dwRIIyttpTtNw4VhUdxB7rdHUrw9HNqAa1gHgR4Q002MOKpkX
	EtH34gUdc1rqCevXfJGqZ+e3J9FoenM/8kXeowVNAVJRKYnA+7EdlDS6CEF+Sv2a2Si7O05
	ZVbr27Xw3bkn/zfTMzFK6Xss8EktWzMvJCpQj8yjdsBl6jl2IC3RlOJfTREhbyYl46SSnwU
	Hnbezklv+t2M30hj+ZkEOrweFuVLWXBRwGuPIr70vpq+slKilusmlWfN/sh2klCTrFUOv9i
	Y36YAtVn3/b+t07tTEkK3+V4DP1J23Pp/qDgRlZrVksI7+PUw9sL/2sPgmNjNCbddttHZaM
	eOLB423kbAB/cuGBhN73iAfSjrS/pnW9wg8OpiD3tWl/pac/edwzO3Lwn3MSLdG+osT3yx/
	abHhHRwjEWhEdLeId7r7vmordOF2aV1eRsT0Eh8g874oFcLR920DbJSrk5/d+HIfkebVDGb
	PBamtxi0WcAlL7yF8VDN7k5JM10TSFruEV8QyOEhjrL8DNQNDn1o6JjAFrUvElCAU3Ga161
	kbISlhcKywa/FMnRyRaHSQ6myeY/ZuHfw6xypg0KSt957wOVEAphKJUg1Pie7sKkM0SZg5j
	DF88K2Me7b4TWYLui/oZAwMogDlglqScZAQ3yoOJRf10LFYmFuf+uFB+CCEfkJd+7gEO5R6
	kpuU
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

--a949f4f959a9e9c73ede8a4278dba00f3ef3605053293f1a8c4444af32a1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> However, unlike the Rockchip driver, spacemit_i2s_dai already has most
> of the playback
> and capture capabilities initialized statically. As a result,
> spacemit_i2s_init_dai() ends up
> assigning the same values again, for example channels_min, channels_max,
> rates,
> and formats, which seems redundant.
>
> If you think that makes sense, I can either remove those redundant
> assignments,
> or make it follow the Rockchip approach by keeping the static
> spacemit_i2s_dai
> minimal and initializing those fields only in spacemit_i2s_init_dai().

Nice catch. Please follow the Rockchip approach: keep the static
spacemit_i2s_dai minimal and initialize the playback and capture fields
conditionally in spacemit_i2s_init_dai().

Simply removing the assignments from spacemit_i2s_init_dai() would leave
channels_min nonzero for both directions in the static template.
snd_soc_dai_stream_valid() treats a direction with a nonzero channels_min
as supported, so the driver would continue advertising capture even for
a device with only a "tx" DMA. The binding permits such a configuration.

Please preserve rate_min and rate_max when moving the capability fields,
and send this change as a separate patch.

                                            - Troy

--a949f4f959a9e9c73ede8a4278dba00f3ef3605053293f1a8c4444af32a1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCanA3aQ0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv1GoA/RVsXEtyqcJ8RIszmDUsvLd9IgXmmHhzlEIWkd7W
P8riAQDkDsHlnhNzz31IA1D0iHM2d+mqgfvD61Dyns2CnOZ3Bw==
=zb68
-----END PGP SIGNATURE-----

--a949f4f959a9e9c73ede8a4278dba00f3ef3605053293f1a8c4444af32a1--
