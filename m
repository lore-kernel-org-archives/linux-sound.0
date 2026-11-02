Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600204;
	b=PAyhAookSgR69ugKtCBj7crIgoaMoQoCiEifEE8iXCZHkmmhZol5h+BItzo72pL1X/Gc
	 LfrY+TCepy19eCEKveNyt0Hc2fRy+VTY4GjoQewGJ/wiYL0ioRHC2oWraFHcXf5XIiQDy
	 Gmd7UqmjzKapFP3ThiuB/zzQU5WPpAq4LHK237i7PfXRytg85kB4RIeJALvAjgctcXI46
	 Ua6jpaScRM1iNunWrnEubQ5bR/sH/sJWi5MZShfRQWWVCrmUsZYrF98gJZmC9ltFjwybp
	 ejO6ndFqzXhIDcG74J9WPJcyHwwe57WcmlGFEAAoE+BUZlQQE0WYGaCfondtXmHy0jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600204;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mtzq0YYn6UXvwTslI5cpbvB8thpVJRf2526YtEvL40k=;
	b=bHYaiqEuGFFrnHK9CfC5wKupAxV/ca7cmiV895nI6ATGXDDlBxOyFl6FKhSKXERWwowG
	 S/uFYy/0XbUw8QJAXfp70pKIAkEETHy56ZR3LUYPhnW4OopnfQpIHwiwJdVUp4C7MHMpr
	 4PVLoJglLOemjxyU4imj6uDFdZZu+QKiDxkUJOhPFP1HmEQqbrtuKQTvfqddQrFiq7753
	 OaJsnOvH5FHiAIZL5u1ABSz2NlCYqveNKe8k01GwZs4sq1S2LoewN87KIRTnEIYLWQkje
	 DZObjFMdqLN/81pbSiP+L4/3GgxeAqvTCFPZ0jtD4BQBOtV8lmRPrCi2awy/8xQnw4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KfJi4R3X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9330F606A32C
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 06:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KfJi4R3X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E690C1F000C1;
	Mon,  2 Nov 2026 06:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793600204;
	bh=mtzq0YYn6UXvwTslI5cpbvB8thpVJRf2526YtEvL40k=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=KfJi4R3Xs+mVURNlEw92DH6madFMwxRAOboMdpt94cFaie1smKif8PhPUYxcRV8lX
	 zpvZAyllzcRVgz24IE0RI55y0uJlwirD16EEaphjYYFprt4NmCP/WZp/LbTYpj9FKA
	 O/xSlfKgxm3z++TUh9dZjw3yf1bG40cDenjBy3wT9EQcq1fSS+Zsk9hpCprMbxT//P
	 h9/62O+AArZUaqsfn3HdTP4hqjPELWg8aS3WKLzNefTrBMqYm97FbI8EkkND4bIaAw
	 SboPih7qbejSOleNdFU7UFoL5VHTRGDzqKTAJuvNBrtXEgc9EfGFrjR4ogF+JFR+nj
	 k0flVjA52DqAQ==
Message-ID: <sashiko-outbox-192944@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] soundwire: stream: Fix bandwidth leak in multi-link
 aggregation failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bard Liao" <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261102060437.824814-3-yung-chuan.liao@linux.intel.com>
References: <20261102060437.824814-1-yung-chuan.liao@linux.intel.com>
 <20261102060437.824814-3-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 06:16:43 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] soundwire: stream: bank state desync in _sdw_prepare_stream() roll=
back
- [High] soundwire: stream: incomplete port and lane rollback in _sdw_prepa=
re_stream()
--

commit 9b420de314ec50416d79ce337f8a1fedd698be52
Author: David Lin <david.lin@intel.com>

soundwire: stream: Fix bandwidth leak in multi-link aggregation failure

This commit snapshots struct sdw_bus_params for each master in a stream
before preparing it and restores all masters' parameters on failure in
_sdw_prepare_stream() to prevent bandwidth leaks on earlier links.

> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 96613dd0677c4..86d951cc92f72 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1477,19 +1477,22 @@ static int _sdw_prepare_stream(struct sdw_stream_=
runtime *stream,
>  	struct sdw_master_runtime *m_rt;
>  	struct sdw_bus *bus;
>  	struct sdw_master_prop *prop;
> -	struct sdw_bus_params params;
>  	int ret;
> =20
> +	/* Pre-pass: snapshot original bus parameters for all masters */
> +	list_for_each_entry(m_rt, &stream->master_list, stream_node)
> +		m_rt->params_backup =3D m_rt->bus->params;
> +
>  	/* Prepare  Master(s) and Slave(s) port(s) associated with stream */
>  	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
>  		bus =3D m_rt->bus;
>  		prop =3D &bus->prop;
> -		memcpy(&params, &bus->params, sizeof(params));
> =20
>  		/* TODO: Support Asynchronous mode */
>  		if ((prop->max_clk_freq % stream->params.rate) !=3D 0) {
>  			dev_err(bus->dev, "Async mode not supported\n");
> -			return -EINVAL;
> +			ret =3D -EINVAL;
> +			goto restore_params;
>  		}
> =20
>  		if (update_params) {
> @@ -1540,7 +1543,13 @@ static int _sdw_prepare_stream(struct sdw_stream_r=
untime *stream,
>  	return ret;
> =20
>  restore_params:
> -	memcpy(&bus->params, &params, sizeof(params));
> +	/*
> +	 * Revert all masters to their snapshotted original parameters.
> +	 * Any master that was not modified will safely revert to its own origi=
nal state.
> +	 */
> +	list_for_each_entry(m_rt, &stream->master_list, stream_node)
> +		m_rt->bus->params =3D m_rt->params_backup;

[Severity: High]
Can this rollback desynchronize bus->params.curr_bank and
bus->params.next_bank from the active hardware register bank when failure
occurs during or after do_bank_switch()?

At the start of _sdw_prepare_stream(), m_rt->params_backup copies the entire
struct sdw_bus_params, including the pre-switch curr_bank and next_bank
values. Later in _sdw_prepare_stream(), do_bank_switch() switches the
hardware bank and flips curr_bank and next_bank (via sdw_bank_switch() or
sdw_ml_sync_bank_switch()), followed by the loop calling
sdw_prep_deprep_ports():

	ret =3D do_bank_switch(stream);
	if (ret < 0) {
		pr_err("%s: do_bank_switch failed: %d\n", __func__, ret);
		goto restore_params;
	}

	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
		bus =3D m_rt->bus;

		/* Prepare port(s) on the new clock configuration */
		ret =3D sdw_prep_deprep_ports(m_rt, true);
		if (ret < 0) {
			dev_err(bus->dev, "Prepare port(s) failed ret =3D %d\n",
				ret);
			goto restore_params;
		}
	}

If sdw_prep_deprep_ports() fails on any link (or if do_bank_switch() fails =
on
a later link after an earlier link has already switched banks), jumping to
restore_params overwrites m_rt->bus->params with m_rt->params_backup across
every master in stream->master_list.

Wouldn't that revert curr_bank and next_bank to their pre-switch values whi=
le
the hardware remains on the newly switched bank (and leave any ports prepar=
ed
on earlier links in the loop prepared), causing subsequent stream operations
to program banked registers into the currently active hardware bank?

[Severity: High]
Also, what happens to the per-port lane assignments and transport parameters
modified by bus->compute_params() on preceding links when restore_params
rolls back m_rt->bus->params?

During _sdw_prepare_stream(), bus->compute_params() calls
sdw_compute_params() -> sdw_compute_bus_params(), which allocates multi-lane
bandwidth in bus->params.lane_used_bandwidth[] and sets non-zero lane numbe=
rs
on the slave and master port runtimes:

	if (m_lane > 0) {
		/* Set Peripheral lanes */
		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
			slave_prop =3D &s_rt->slave->prop;
			for (l =3D 1; l < SDW_MAX_LANES; l++) {
				if (slave_prop->lane_maps[l] =3D=3D m_lane) {
					list_for_each_entry(s_p_rt, &s_rt->port_list, port_node) {
						s_p_rt->lane =3D l;
						...
					}
					break;
				}
			}
		}
		...
		list_for_each_entry(m_p_rt, &m_rt->port_list, port_node) {
			m_p_rt->lane =3D m_lane;
		}
	}

It then calls _sdw_compute_port_params(), which updates p_rt->transport_par=
ams
across the ports on that bus.

When a subsequent step or link in _sdw_prepare_stream() fails, restoring
m_rt->bus->params =3D m_rt->params_backup reverts
bus->params.lane_used_bandwidth[] and bus->params.curr_dr_freq, but leaves
s_p_rt->lane, m_p_rt->lane, and p_rt->transport_params modified.

If the stream is later deprepared in _sdw_deprepare_stream():

		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
			if (!p_rt->lane)
				continue;

			bandwidth =3D m_rt->stream->params.rate * hweight32(p_rt->ch_mask) *
				    m_rt->stream->params.bps;
			multi_lane_bandwidth +=3D bandwidth;
			bus->params.lane_used_bandwidth[p_rt->lane] -=3D bandwidth;
			if (!bus->params.lane_used_bandwidth[p_rt->lane])
				p_rt->lane =3D 0;
		}

won't seeing a non-zero p_rt->lane after bus->params.lane_used_bandwidth[]
was rolled back underflow bus->params.lane_used_bandwidth[p_rt->lane] and
skip releasing multi_lane_bandwidth from bus->params.bandwidth, or cause
sdw_compute_group_params() and _sdw_compute_port_params() to skip the ports
when bus->params.lane_used_bandwidth[p_rt->lane] is zero?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102060437.8248=
14-1-yung-chuan.liao@linux.intel.com?part=3D2
