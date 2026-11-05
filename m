Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878171;
	b=BFEdn8XD3CxqUhNwcqwnDmjGgAufb8ipd+eEf3+Zq15tfZwnHOAoePp8Zfy/+28mCa09
	 ahmKwAEXlA2DM8FwIEvWCsHCUjiPFvTONjTHXjbf1IamzdbLBFMRuX+QHmZQH8eGfRPqm
	 TeXpwtI8VH8T7lPE3P4++o6fEGb7LV+M3GZoADoZI8hu22DI/k+8StdCxDvmnXZJnNgSd
	 31nsPIG5z+vd+TX7w0BBqYtl9GHZywFZhBfkn9q9vsL+a6KJCM9LNqfliWdv3aJYFXRlT
	 V8uKjfLVOmWRX7iCxne/1D9dvOlQfU50BNDDQxrSN68I+oxm04AhqUj2xtE0/eBN5vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878171;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9U9GB3endV6JAjeDDhjtVJSKjAitnI4NRLIWnORLmss=;
	b=JBZjGUPkft/4xl1aYF5unGB0dLHQbgyAYOknrITWnnQNQvxySfmxSJb6dzuTKHmMORh8
	 p8YBkBLLtpVH1lTu6yFe5S38BBeE8CJY8lH/coaDMtJofILlocvS5HiWg+ZGOeeNofiVT
	 c6xlJ9HAI4xogcokHDOVU6zS9AnYcHI1UGJYq0cmRb1ECFOJu/VvrnLNPphI0eUda3JGE
	 YXJi0RF/Z6QKbxscg4sZG/R/NdxgUHDW2d0oAXMw2Zpjxr0Ui5JdcgKkOG/+ZnzAHAXZR
	 eKB68VNCKnwbiRtFVWn5w/lUg0qyEtS73b7J/3SbCeR1wKLPTEkyQXRMwOMPYCOVang==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m5Gy0by0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1078B606A31B
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 11:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m5Gy0by0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70451F00919;
	Thu,  5 Nov 2026 11:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793878170;
	bh=9U9GB3endV6JAjeDDhjtVJSKjAitnI4NRLIWnORLmss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m5Gy0by0qIyS3vmpAHkE1nNi5yoQb8cwGg8zu5INgvLVLKXj0bS/7qVchVYXlj5uD
	 NfdOvs6Yy12YC81HCTasARL76leWLC2wN5/yKWJVSwnZfeXk6/XBKMcfN/sWu8du2X
	 7BcXnQLEP6KC+9wVNSK6z4AQudjE0diOT6io2MYzucfux2sZ6J+lbkxSoDS1tfjmSt
	 4jWz3kM8BQ5XyZxY0HMcFC3JFZGyJ00IAWi0nRAdztSF02qz9h1sBjCIqZvJbxgek0
	 NCTCrvDRkgG3NDwjAbqgUSc9bmi+OCGsvtwbKqCzWRBLQXGvSX3A0vNLhUPGycglfg
	 Uu3A0Bt1dDStA==
Message-ID: <sashiko-outbox-198950@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 v2 2/2] soundwire: qcom: Add set_channel_map support
 to SWR master DAI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261105-soundwire_channel_map-v2-2-5efe2021552a@oss.qualcomm.com>
References: <20261105-soundwire_channel_map-v2-0-5efe2021552a@oss.qualcomm.com>
 <20261105-soundwire_channel_map-v2-2-5efe2021552a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 11:29:30 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] soundwire: qcom: lock ordering inversion in qcom_swrm_port_enable()
- [High] soundwire: qcom: zero slot masks in qcom_swrm_set_channel_map() cl=
obber ports
- [High] soundwire: qcom: single-direction qcom_swrm_set_channel_map() clob=
bers other direction
--

commit c509f8b3c2506c16cc2d00c47ddc8257189902cf
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

soundwire: qcom: Add set_channel_map support to SWR master DAI

This commit adds .set_channel_map support to the Qualcomm SoundWire master
DAI so the ASoC layer can configure per-port TX and RX channel masks used by
qcom_swrm_port_enable().

> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 147e55b7a600b..c411c3628dee4 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c

[ ... ]

> @@ -1188,12 +1192,28 @@ static int qcom_swrm_port_enable(struct sdw_bus *=
bus,
>  {
>  	u32 reg;
>  	struct qcom_swrm_ctrl *ctrl =3D to_qcom_sdw(bus);
> +	struct qcom_swrm_port_config *pcfg;
>  	u32 val;
>  	u32 offset =3D ctrl->reg_layout[SWRM_OFFSET_DP_PORT_CTRL_BANK];
> =20
>  	reg =3D SWRM_DPn_PORT_CTRL_BANK(offset, enable_ch->port_num, bank);
> =20
>  	ctrl->reg_read(ctrl, reg, &val);
> +	pcfg =3D &ctrl->pconfig[enable_ch->port_num];
> +
> +	mutex_lock(&ctrl->port_lock);

[Severity: High]
Does acquiring ctrl->port_lock inside qcom_swrm_port_enable() cause a lock
ordering inversion with ctrl->bus.bus_lock?

During hw_params, qcom_swrm_hw_params() -> qcom_swrm_stream_alloc_ports()
acquires ctrl->port_lock and then calls sdw_stream_add_master(), which locks
bus->bus_lock:

drivers/soundwire/qcom.c:qcom_swrm_stream_alloc_ports() {
	guard(mutex)(&ctrl->port_lock);
	...
	sdw_stream_add_master(&ctrl->bus, &sconfig, pconfig,
			      nports, stream);
}

During stream enable and disable, sdw_enable_stream() and sdw_disable_strea=
m()
acquire bus->bus_lock via sdw_acquire_bus_lock() before calling into
bus->port_ops->dpn_port_enable_ch(), which invokes qcom_swrm_port_enable() =
and
acquires ctrl->port_lock in the reverse order (bus->bus_lock ->
ctrl->port_lock).

> +	if (enable_ch->port_num <=3D ctrl->num_dout_ports) {
> +		if (pcfg->rx_ch_map_valid)
> +			enable_ch->ch_mask =3D pcfg->rx_ch_mask;
> +		else if (pcfg->tx_ch_map_valid)
> +			enable_ch->ch_mask =3D pcfg->tx_ch_mask;
> +	} else {
> +		if (pcfg->tx_ch_map_valid)
> +			enable_ch->ch_mask =3D pcfg->tx_ch_mask;
> +		else if (pcfg->rx_ch_map_valid)
> +			enable_ch->ch_mask =3D pcfg->rx_ch_mask;
> +	}
> +	mutex_unlock(&ctrl->port_lock);
> =20
>  	if (enable_ch->enable)
>  		val |=3D (enable_ch->ch_mask << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
> @@ -1413,6 +1433,39 @@ static void *qcom_swrm_get_sdw_stream(struct snd_s=
oc_dai *dai, int direction)
>  	return ctrl->sruntime[dai->id];
>  }
> =20
> +static int qcom_swrm_set_channel_map(struct snd_soc_dai *dai,
> +				     unsigned int tx_num, const unsigned int *tx_slot,
> +				     unsigned int rx_num, const unsigned int *rx_slot)
> +{
> +	struct qcom_swrm_ctrl *ctrl =3D dev_get_drvdata(dai->dev);
> +	unsigned int max_ports =3D ctrl->nports;
> +	unsigned int i;
> +
> +	if ((tx_num && !tx_slot) || (rx_num && !rx_slot))
> +		return -EINVAL;
> +
> +	mutex_lock(&ctrl->port_lock);
> +	for (i =3D 1; i <=3D max_ports; i++) {
> +		ctrl->pconfig[i].tx_ch_map_valid =3D false;
> +		ctrl->pconfig[i].rx_ch_map_valid =3D false;

[Severity: High]
As reported by Sashiko on v1 [1], when qcom_swrm_set_channel_map() is called
for a single stream direction, does unconditionally resetting both
tx_ch_map_valid and rx_ch_map_valid to false clobber the opposite direction=
's
channel map?

In qcom_snd_sdw_startup(), playback calls snd_soc_dai_set_channel_map() with
tx_num =3D 0 and rx_num =3D SDW_MAX_PORTS, whereas capture calls it with
tx_num =3D SDW_MAX_PORTS and rx_num =3D 0. Because all DAIs on the controll=
er
share ctrl->pconfig[], starting a playback stream clears tx_ch_map_valid ac=
ross
all ports and sets rx_ch_map_valid =3D true, while starting a capture stream
clears rx_ch_map_valid and sets tx_ch_map_valid =3D true.

In addition, because qcom_swrm_port_enable() falls back to the opposite
direction's mask when a port's own direction flag is false:

	if (enable_ch->port_num <=3D ctrl->num_dout_ports) {
		if (pcfg->rx_ch_map_valid)
			enable_ch->ch_mask =3D pcfg->rx_ch_mask;
		else if (pcfg->tx_ch_map_valid)
			enable_ch->ch_mask =3D pcfg->tx_ch_mask;
	} else {
		if (pcfg->tx_ch_map_valid)
			enable_ch->ch_mask =3D pcfg->tx_ch_mask;
		else if (pcfg->rx_ch_map_valid)
			enable_ch->ch_mask =3D pcfg->rx_ch_mask;
	}

won't DIN (TX) ports end up using pcfg->rx_ch_mask after a playback
set_channel_map() call, and DOUT (RX) ports end up using pcfg->tx_ch_mask
after a capture set_channel_map() call?

> +
> +		/* TX setup */
> +		if (tx_slot && i < tx_num) {
> +			ctrl->pconfig[i].tx_ch_mask =3D tx_slot[i];
> +			ctrl->pconfig[i].tx_ch_map_valid =3D true;
> +		}
> +
> +		/* RX setup */
> +		if (rx_slot && i < rx_num) {
> +			ctrl->pconfig[i].rx_ch_mask =3D rx_slot[i];
> +			ctrl->pconfig[i].rx_ch_map_valid =3D true;
> +		}

[Severity: High]
As reported by Sashiko on v1 [2], if tx_slot[i] or rx_slot[i] is 0 for an
unused or unmapped port in the sparse channel map array, will marking
tx_ch_map_valid or rx_ch_map_valid as true cause qcom_swrm_port_enable() to
override enable_ch->ch_mask with 0?

Codec callbacks such as wcd937x_get_channel_map() and pm4125_get_channel_ma=
p()
populate a 15-element (SDW_MAX_PORTS) sparse array where unmapped or inacti=
ve
master ports have slot[i] =3D=3D 0:

sound/soc/codecs/wcd937x.c:wcd937x_get_channel_map() {
	for (i =3D 0; i < SDW_MAX_PORTS; i++)
		rx_slot[i] =3D wcd->master_channel_map[i];

	*rx_num =3D i;
}

Since max_ports <=3D 14 < SDW_MAX_PORTS, i < tx_num or i < rx_num is true f=
or
every port 1..max_ports. Any port whose slot entry is 0 gets tx_ch_mask =3D=
 0 or
rx_ch_mask =3D 0 with the valid flag set to true, so qcom_swrm_port_enable(=
) will
overwrite the stream-provided enable_ch->ch_mask with 0 instead of falling
back to the stream's channel mask.

[1] https://lore.kernel.org/r/20260629141633.86657-3-mohammad.rafi.shaik@os=
s.qualcomm.com
[2] https://lore.kernel.org/r/20260629141633.86657-3-mohammad.rafi.shaik@os=
s.qualcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-soundwire_=
channel_map-v2-0-5efe2021552a@oss.qualcomm.com?part=3D2
