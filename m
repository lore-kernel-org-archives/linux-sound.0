Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560842;
	b=Ehiqb7YHAjfOi9MR6XjPAmnEI6w4W2+RPdcDOtxhd9LVugieg+F2NnzagczSGhoXkLLe
	 g64qHTT2SM5+TkZMJALPzQaGrRhuggiYX6r515DWPDvGCSVB6fTlJ/wN82y3Y2Vyzi8DE
	 Z5J5M2V9bsoDs1Z/BoF8j9zz7aw8jfhc73XMTzJJNyPsAoq+p7o5vz5upRLbNuF3Ms1w3
	 NpBAAndodpVRf27DE6PMbnW6T86C8sAgWLiAfOSYr2g1lfvQiXK0zc8mh5pLab8eDWcVW
	 fZ7iwY5Fru9oc0ED+BD+W+tU1/J6T05leZjHDXZukCT3it1gheLtWTp4z1Zwih7qrsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560842;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VsHFV8y18PL9XMgxBPz2XTqdzz1+Dzpsma3NK/rAyN8=;
	b=3kP3YwDskECa9z+wG/LbGMnDBa1O+T7JcHcLR8z6unC5T5OLij7V9rTFu3S8nVpIwqpI
	 tMAAu210lmV0dUxVBBCsWGe0WDAaNav44Wpor4kI6GmDkJBco9N+mZLmE5IvBe3Np7k4d
	 28H/M+/5LQ3WZlpylRcoHTFOMtbs74pRxM2vNfOZfwMwHuFbminh1pFxMy4+FxdCoLNPb
	 b2W9d2EIFyAg3c3eSXJ8xGyv8iTF3DxkBIgWL7bbQqV1wS6XAmi3FR9jkM3QdJPQR3GEs
	 TMduJSCXl23UpGLeXL5D5vphH7XJjkj9v2kuyC7j9yh3EPjkUHEWqdhEzlbdPpH0Sgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CkvOGlsd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A919606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 22:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CkvOGlsd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF791F000CF;
	Tue, 24 Nov 2026 22:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795560841;
	bh=VsHFV8y18PL9XMgxBPz2XTqdzz1+Dzpsma3NK/rAyN8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CkvOGlsdyiGRgOm8Am9p13ECh5QxNRCxsqr4eFk0CRpa+IvuhrDnEl5nzKC944cX0
	 D4BJNrsQUxrY1E4ySuYc1Vv0v2IPyPUqccn/v185bG6o7d+Q8urS+CLWqtfbWTKvsj
	 WTtDhbsmonNiNcM1vu+W9n+Uyw5sB4obew3rh8dxM3l52mKEZ6z9CgHV2QBHc7brtx
	 KoDYkBeRneizkyjZkurJBSFFpR6c3+bAa7wugqi9Es+BSfErkPKlzjOu7F4BdimtT+
	 avl9Yxi8+GBTrmrjgPGrpdhQvhTHOpDL5GSFpuoX6pTBQxALugFaD9ifg+rngHJ3Mz
	 jDIsCzCj9ONjA==
Message-ID: <sashiko-outbox-232167@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] soundwire: qcom: populate wr_fifo_depth before
 enabling interrupts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Ijtsma" <robertijtsma@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261124-qcom-soundwire-fixes-v1-2-8ca94d60ddd6@gmail.com>
References: <20261124-qcom-soundwire-fixes-v1-0-8ca94d60ddd6@gmail.com>
 <20261124-qcom-soundwire-fixes-v1-2-8ca94d60ddd6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 22:54:01 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] soundwire: qcom: Fixes trailer cites 02efb49aa805 instead of
  a661308c34de
- [Low] soundwire: qcom: redundant unchecked SWRM_COMP_PARAMS read in
  qcom_swrm_init()
--

commit 6cb5da021ef8535ab5b5f9bfc4e8100a46f9d35b
Author: Robert Ijtsma <robertijtsma@gmail.com>

> soundwire: qcom: populate wr_fifo_depth before enabling interrupts
>
> ctrl->wr_fifo_depth is currently populated at the end of
> qcom_swrm_init(), after devm_request_threaded_irq() in qcom_swrm_probe()
> and after enabling CPU interrupts in qcom_swrm_init().
>
> If a SoundWire interrupt fires before SWRM_COMP_PARAMS has been read,
> qcom_swrm_cmd_fifo_wr_cmd() observes ctrl->wr_fifo_depth =3D=3D 0 and fai=
ls
> with -EIO ("err write overflow").
>
> Read and validate SWRM_COMP_PARAMS in qcom_swrm_probe() prior to
> requesting the threaded IRQ, and read SWRM_COMP_PARAMS before enabling
> CPU interrupts in qcom_swrm_init().
>
> Fixes: 02efb49aa805 ("soundwire: qcom: add support for SoundWire controll=
er")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>

[Severity: Low]
Should the Fixes: tag point to a661308c34de ("soundwire: qcom: wait for
fifo space to be available before read/write") instead of 02efb49aa805
("soundwire: qcom: add support for SoundWire controller")?

Commit a661308c34de ("soundwire: qcom: wait for fifo space to be available
before read/write") introduced ctrl->wr_fifo_depth, the SWRM_COMP_PARAMS
read at the end of qcom_swrm_init(), and swrm_wait_for_wr_fifo_avail() in
qcom_swrm_cmd_fifo_wr_cmd().

> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 368f511867835..3a42ab85be7c6 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -997,6 +997,12 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctr=
l)
>  	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
>  			0xFFFFFFFF);
> =20
> +	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
> +	if (ctrl->version >=3D SWRM_VERSION_3_1_0)
> +		ctrl->wr_fifo_depth =3D FIELD_GET(SWRM_V3_COMP_PARAMS_WR_FIFO_DEPTH, v=
al);
> +	else
> +		ctrl->wr_fifo_depth =3D FIELD_GET(SWRM_COMP_PARAMS_WR_FIFO_DEPTH, val);
> +

[Severity: Low]
Is re-reading SWRM_COMP_PARAMS in qcom_swrm_init() needed now that
qcom_swrm_probe() reads and validates ctrl->wr_fifo_depth before requesting
the IRQ or calling qcom_swrm_init()?

SWRM_COMP_PARAMS is a static capability register, and this second read does
not check the return status of ctrl->reg_read().  If a transient regmap
read error occurs during controller initialization or runtime resume, val
retains the value previously read from SWRM_MCP_CFG_ADDR and overwrites the
validated ctrl->wr_fifo_depth with 0, causing later command FIFO writes to
fail with -EIO.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-qcom-sound=
wire-fixes-v1-0-8ca94d60ddd6@gmail.com?part=3D2
