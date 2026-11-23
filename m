Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455525;
	b=1Q7ARRa115u2lXtAifj1pk5KCk+QBcez+ViGUvu/XkBAPyPUM6q4G9kB16DYlgE7O0Fw
	 gCceOL1+RVUuzVbyzbeHywpYH7d17WYtVsMxtRsL3H9IaJbU/LFsqrllAesnonXCVqe/C
	 E9R9EDm6dG3Lwn+W/L2gZHnnFDBKeSHhZcZMoFyQas2Pqnv/m2OyDQSLG3kpOpHGLsot5
	 +cTNajU1IgSqLyEb41otfyyTPVCYxZIptC4zv2n2S5F4RhYOK8tSmonbZqoWPyc58tOo8
	 LxQVS0F8K4k9mQuoADqJiiIKpa31UanlK7ODkrZ60tA7ew4h0tFKHhrLsMNc6yMwmaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455525;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9qc1yKk+s8UvyJspfChBLI/+g2nCbxMm3s3EwGgcNxg=;
	b=KT1BhPl1LlRNI2W5w3oA06NOC9u/Ivf/1r1f125xCfkVe8o60Uy2RstXzzLikrpelEIv
	 Hl3tDsX9QGqpY4IjPecuwEtGy0xpX26XEchJjMNA7Sw566107tghuUhFJIy3+VnGKTadc
	 ByV7QQNqlaKkVG896N1t3pmZUrPEMuD1ZUh4T25fY2C+aZ6TUKvEUAvNK4N7nMt65x490
	 Qw6eZl+EMd/xAtnpsC91JgRw9G+5wSt4iNrTQIEPSPLkFf+B3U+AOzi2qsezlvoBIF9VV
	 Mg88jzSCatkb61sV24wAye3YVfXUetJkKi8WiQ7SUam275HvsRK0KnTee1Ihwblo4Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MepdvLoB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A434A606A31F;
	Mon, 23 Nov 2026 17:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MepdvLoB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B8C1F000D4;
	Mon, 23 Nov 2026 17:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795455525;
	bh=9qc1yKk+s8UvyJspfChBLI/+g2nCbxMm3s3EwGgcNxg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MepdvLoBUWtYb0c9aF2qO56z39oFW3ETU/kZmxRBZ5r2wMQ7kMO2mFmke/sHM8BoX
	 8FMKTK6NaLYqczOjRZa5ufFhT1pXgQ3g3PYsxt2JZlWpVqGe7sI/LfhkQQpceNNjDN
	 OizIp/vue1jqlFqajJkrbLJmhKI67CLF5HEPDmIy3VvinRtxx4A+sWyyeXFjJJ0fHp
	 ThxXWD4Zw8DwJKy5O2KHTpYLXN5USm6+OkWbgRVPVc4q2EAnq2eWfEQUU+yW7LfGQ3
	 dOsHuJKtKy7tRIJ9igEWCKMhBJRBwURazhOvQ89srjM92U8RcLuHT+toQc+Y5iWPmb
	 1MRIUTi7f1ZhA==
Message-ID: <sashiko-outbox-229770@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] soundwire: qcom: add multi-master support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123171411.444381-3-srinivas.kandagatla@oss.qualcomm.com>
References: <20261123171411.444381-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261123171411.444381-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 17:38:44 +0000
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
- [High] soundwire: qcom: missing peer reset and init in
  swrm_runtime_resume()
- [Medium] soundwire: qcom: broken peer DPn offset check in
  qcom_swrm_port_target()
--

commit 246740e00d8bf63dfe08723ccdaf279410a75753
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

soundwire: qcom: add multi-master support

This commit adds multi-master support for Qualcomm v3.1.0+ SoundWire
controllers, allowing a primary controller to pair with a dependent
controller that contributes additional DATA lanes and routes port register
accesses across the two instances.

> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index a4cb62897192e..396b57d8eb0e9 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
[ ... ]
> @@ -1091,9 +1109,48 @@ static int qcom_swrm_pre_bank_switch(struct sdw_bu=
s *bus)
>  	u32p_replace_bits(&val, ctrl->cols_index, SWRM_MCP_FRAME_CTRL_BANK_COL_=
CTRL_BMSK);
>  	u32p_replace_bits(&val, ctrl->rows_index, SWRM_MCP_FRAME_CTRL_BANK_ROW_=
CTRL_BMSK);
> =20
> +	if (ctrl->peer_ctrl)
> +		ctrl->peer_ctrl->reg_write(ctrl->peer_ctrl, reg, val);
> +
>  	return ctrl->reg_write(ctrl, reg, val);
>  }
> =20
> +static struct qcom_swrm_ctrl *
> +qcom_swrm_port_target(struct qcom_swrm_ctrl *ctrl, u8 port_num, u32 *reg)
> +{
> +	u8 lane;
> +
> +	if (WARN_ON_ONCE(!port_num || port_num > ctrl->nports))
> +		return ctrl;
> +
> +	lane =3D ctrl->pconfig[port_num].lane_control;
> +
> +	if (ctrl->peer_ctrl && lane >=3D ctrl->peer_first_lane &&
> +	    lane < ctrl->peer_first_lane + ctrl->num_peer_lanes) {
> +		if (WARN_ON_ONCE(*reg < ctrl->peer_dpn_offset))
> +			return ctrl;
> +		*reg -=3D ctrl->peer_dpn_offset;
> +		return ctrl->peer_ctrl;
> +	}
> +	return ctrl;
> +}

[Severity: Medium]
Can *reg -=3D ctrl->peer_dpn_offset underflow below the dependent
controller's DP1 register base when port_num <=3D offset?

Callers compute *reg with the SWRM_DPn_* macros as base_offset + 0x100 *
(port_num - 1) (+ 0x40 * bank), where base_offset is 0x1224..0x123c, while
qcom_swrm_multi_master_setup() sets ctrl->peer_dpn_offset to offset *
0x100 without that base address.  As a result, *reg < ctrl->peer_dpn_offset
does not catch port_num <=3D offset, and subtracting ctrl->peer_dpn_offset
produces an offset below DP1 (0x1224) that reads or writes non-DPn
registers on ctrl->peer_ctrl.

Also, qcom_swrm_transport_params() subtracts ctrl->peer_first_lane from
value before calling qcom_swrm_port_reg_write(), so if the WARN_ON_ONCE
fallback returns ctrl, the peer-shifted lane number is written to the
primary controller, and qcom_swrm_multi_master_setup() only checks offset
against ctrl->num_lanes rather than bounding the port offset against
ctrl->nports.

[ ... ]
> @@ -1795,6 +2028,10 @@ static int __maybe_unused swrm_runtime_resume(stru=
ct device *dev)
>  	struct qcom_swrm_ctrl *ctrl =3D dev_get_drvdata(dev);
>  	int ret;
> =20
> +	/* no bus of its own; the primary restarts the link */
> +	if (ctrl->mm_role =3D=3D QCOM_SWRM_MM_DEPENDENT)
> +		return clk_prepare_enable(ctrl->hclk);
> +
>  	if (ctrl->wake_irq > 0) {
>  		if (!irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
>  			disable_irq_nosync(ctrl->wake_irq);

[Severity: High]
Does swrm_runtime_resume() leave the dependent controller's audio_cgcr
unreset and skip re-initializing ctrl->peer_ctrl when
clock_stop_not_supported is set?

For QCOM_SWRM_MM_DEPENDENT, swrm_runtime_resume() enables ctrl->hclk and
returns without calling reset_control_reset(ctrl->audio_cgcr).  In the
primary controller's resume path, the clock_stop_not_supported branch soft
resets and calls qcom_swrm_init(ctrl) on the primary alone:

drivers/soundwire/qcom.c:swrm_runtime_resume() {
    ...
	if (ctrl->clock_stop_not_supported) {
		reinit_completion(&ctrl->enumeration);
		ctrl->reg_write(ctrl, SWRM_COMP_SW_RESET, 0x01);
		usleep_range(100, 105);

		qcom_swrm_init(ctrl);
    ...
	} else {
		reset_control_reset(ctrl->audio_cgcr);
    ...
}

Unlike qcom_swrm_probe(), which initializes both ctrl and ctrl->peer_ctrl,
a runtime suspend and resume leaves the dependent controller without an
audio_cgcr reset and out of sync with the primary (such as on the old
frame control bank after a primary reset back to bank 0), breaking data
transport on the dependent lanes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123171411.4443=
81-1-srinivas.kandagatla@oss.qualcomm.com?part=3D2
