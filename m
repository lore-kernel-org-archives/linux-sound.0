Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604141;
	b=1MDbSY/5omccqaV+6hD6LIgPN2A6nnr029GewgEPvLtmSjYF/1IK+iG16PlifElAYkPk
	 D+5QChrPQy1z/fQjI0X0iynfE1uf0hyPrmDHCFTtmGpGw/jjKIyi3WoTGuPLRNK1ocpeM
	 6qYmIhqYJk+yI4jDoIs/D3hn8+Laxv5bo0a/LMsMYRAqTiw0WrG4KWi84azhaxE0h+70y
	 Cke7lwHEAi2w2GY5uKkl5LsVCqDXuPmvl83v39rANEJUougAWVp0gmo1eD1Lp6jNLCw61
	 n1nxjHr3nXBFhEiX6rLeLQXDWaMLYYp5DLrKfDCgHjwgX0gv0uzRZewmVmc891w+aFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604141;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SEJtYCC+sawf3FR5jBgcp7z0VSXuRyftBPc3qpP8J1k=;
	b=CkM4MlrPMI24wRfxmL8fsgrocbDut0jOGa7FL6iO7Ujh4TvDt3WFQT967JmKXvGqkXc5
	 pIp+mukC6vpgponUIrk53Fb8ohSqc+w7J/ykEbmKqB08dCph0FqxpLr0FMwKm2Zl7nhcU
	 3PS+4aTm4l98SV5DAEIZztrqMErrTF/k3IxwZFcce4ue/HoEfvI8Gq2MK6PXFhSXJbGKn
	 vYWp4T8q1ASS3lowulbebC1vzH148FI8HgEr97rkBWXj30oGKMUonZZS8iVPJ9dexRrh1
	 /U7KunkTSdzibdWByYncMCrY7ID/MLDCHy1XpbdZQHv9KxfdIEFf6PurnTudboT3O2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EATtXw9S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C74E606A321
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 10:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EATtXw9S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D85E1F000C0;
	Wed, 25 Nov 2026 10:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795604140;
	bh=SEJtYCC+sawf3FR5jBgcp7z0VSXuRyftBPc3qpP8J1k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EATtXw9S7bjMTrSjgQ8ovpNmJB98QgRsIqkjUcIflKJvsPDFdoqr6Yy2HnEtqolEN
	 Y8UdCQAhjPa1VRP55D1dxIq5DBF8lZoICsh22f5OUUa6/5nJmImsu8+YxnC6utwYkc
	 hD91OsIT4QxUCXS0nxUlMui1eC0lXd9VHdurM1K6Iw8Elk9HU9xt7nP41kqVVY83MA
	 xqLCcyu3cN/3OqMMlUxcpGx42ChiTkhImeKb4AcDb7nAeSk1R3at/va87tiCmOuxLX
	 r6KVcf1dXuQ91CgXcKH9pRLMGfnczVXmPaiSxLhdwKhGKpGB222ox3Tjti4mcCH3WZ
	 QID1cPU2zyBRQ==
Message-ID: <sashiko-outbox-233175@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] soundwire: qcom: program SSP period on multi-master
 primary
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261125103825.936939-5-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125103825.936939-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261125103825.936939-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 10:55:40 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] soundwire: qcom: qcom_swrm_pre_bank_switch() writes
  SSP_PERIOD to peer
--

commit ea2417312b39017aa66bb591f5dc0c79d434de58
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

soundwire: qcom: program SSP period on multi-master primary

This commit programs SWRM_MCP_FRAME_CTRL_BANK_SSP_PERIOD_BMSK (and zeroes
SWRM_MCP_FRAME_CTRL_BANK_CLK_DIV_BMSK on bank switch) in
SWRM_MCP_FRAME_CTRL_BANK_ADDR on the multi-master primary controller at
initialization and before each bank switch.

> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index e0392f3cda34e..3476edd7c4236 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c

[ ... ]

> @@ -1005,10 +1011,16 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *=
ctrl)
>  	/* Clear Rows and Cols */
>  	val =3D FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, ctrl->rows_i=
ndex);
>  	val |=3D FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, ctrl->cols_=
index);
> +	if (ctrl->mm_role =3D=3D QCOM_SWRM_MM_PRIMARY)
> +		val |=3D FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_SSP_PERIOD_BMSK,
> +				  SWRM_SSP_PERIOD(ctrl->bus.params.row,
> +						  ctrl->bus.params.col));
> =20
>  	reset_control_reset(ctrl->audio_cgcr);
> =20
>  	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
> +	if (ctrl->mm_role =3D=3D QCOM_SWRM_MM_PRIMARY)
> +		ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(1), val);
> =20
>  	/* Enable Auto enumeration */
>  	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 1);
> @@ -1191,6 +1203,14 @@ static int qcom_swrm_pre_bank_switch(struct sdw_bu=
s *bus)
>  	if (ctrl->peer_ctrl)
>  		ctrl->peer_ctrl->reg_write(ctrl->peer_ctrl, reg, val);
> =20
> +	if (ctrl->mm_role =3D=3D QCOM_SWRM_MM_PRIMARY) {
> +		u32p_replace_bits(&val, 0,
> +				  SWRM_MCP_FRAME_CTRL_BANK_CLK_DIV_BMSK);
> +		u32p_replace_bits(&val,
> +				  SWRM_SSP_PERIOD(bus->params.row, bus->params.col),
> +				  SWRM_MCP_FRAME_CTRL_BANK_SSP_PERIOD_BMSK);
> +	}
> +
>  	return ctrl->reg_write(ctrl, reg, val);
>  }

[Severity: Medium]
Does qcom_swrm_pre_bank_switch() write the primary controller's
SWRM_MCP_FRAME_CTRL_BANK_SSP_PERIOD_BMSK value into ctrl->peer_ctrl?

qcom_swrm_pre_bank_switch() reads val from the primary controller ctrl,
where both banks already have SWRM_MCP_FRAME_CTRL_BANK_SSP_PERIOD_BMSK
populated from qcom_swrm_init(), updates only the row and column fields,
and writes that val directly to ctrl->peer_ctrl.  As a result, every bank
switch copies the primary's previous SSP_PERIOD (and any un-cleared
CLK_DIV bits) into the dependent controller's FRAME_CTRL_BANK register
instead of leaving SSP_PERIOD at 0 on the dependent.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125103825.9369=
39-1-srinivas.kandagatla@oss.qualcomm.com?part=3D4
