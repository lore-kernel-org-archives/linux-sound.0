Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469047;
	b=ZtGprjc8btHqWT1Fpzj6RQQuUsU6rGjhbWumxJYu2DCys6AMoI1GTLnKeD2ax8cCU42a
	 +Powq5AA8grHkLb76BlDJ8Z1vqK54Dd77nAfOMs8pNRgfusO78HRYRKfy3BmWtrUPf7nU
	 Sm2eNnYec3jEv9sgYADYt+yUlG+vycehGHpEcC5C8Iq8SraS1//yIpweTDdptj7ZZgoyO
	 p3aWxEVjfPj4xLh90XVXNmGo+QeEtVUrXlQ3uVJdp1fu1R7NdOV5c0W4WIG9w96d/okIG
	 xr+gbirepy3nFxKqdqYMn2hry4Nyx+rBLTmWt7KZEMBbbUSJFU1o6O8/ay1jzQpdh5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469047;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AJreelrWgE6OQjhrAXSiWqvk+KF1HYeIlFhlURaPUB8=;
	b=3iNOjMxZtPc2TdjLZMT9tZ1ucsiqxStXTEYlWlKWiOlVqzsKiHWfoUpxHx6eycyzdbxS
	 kTQIrTswsUmw53Bdt4/4OEDodlp1dUJlCffmc9AC6z+m1CDkTG0zbbLwCNc0kq3ixXSST
	 JQE0MzXNVMyTdAwA/RfsvrhYo7Jx74hIjcoB5NrKK1ErhGgUDFcmISnUPR7BAAWygAzUD
	 yLdFpzAneTH6h3PKPHVDiaNl92Vk+7mHIDCjaCfJgyU1ASYGu2g00JHSU41p9MXsVBHv9
	 eFnBS64GNE+bGf4F+n5wMNMLAHV7tmi0k3fGBIpY7us6Yy3SgN2awPoOQIG8l/k01KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mqHJX2Jv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9F9606A32A
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 07:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mqHJX2Jv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9981F00A05;
	Thu, 12 Nov 2026 07:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794469047;
	bh=AJreelrWgE6OQjhrAXSiWqvk+KF1HYeIlFhlURaPUB8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=mqHJX2Jv2IXSAkvNQZKJidsQGFvkqDA4CJdiVh4+HFe+BPAICnLJKfhZzGz7kX+hr
	 RKNez21TafR+aK4H3c+J4XqF8t7nAQAJMtCZcpf/73yxAZz/1xeBi5Dvj0EcuhOBfX
	 RSXWBFR4uVGcpf1kt8OuduT0bqbB8UShs450xC8LLsj2qQMVJfDvoL8AauCgoFnfrz
	 Wb9IWPjh3DMBd7dvAhWL+J2nzzyt5Vo+EJm444a+0OvQbs6/FBJPAY5x3/IXPNxZdN
	 qXoQgM6CDH8/cAlosMITxUfc2uH5lfQvUPmy0+ml3rSszrHXd9SzwNqRrq0NndeSST
	 llXB63Z9h+CcQ==
Message-ID: <sashiko-outbox-210619@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] soundwire: stream: Fix bandwidth leak in
 multi-link aggregation failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bard Liao" <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261112072105.1296515-6-yung-chuan.liao@linux.intel.com>
References: <20261112072105.1296515-1-yung-chuan.liao@linux.intel.com>
 <20261112072105.1296515-6-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 07:37:26 +0000
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
- [High] soundwire: incomplete port lane and transport rollback in
  _sdw_prepare_stream()
- [High] soundwire: stream: bank state desync in _sdw_prepare_stream()
  rollback
--

commit f77415deadf5285d82da231d58b3652a2ff280ce
Author: David Lin <david.lin@intel.com>

soundwire: stream: Fix bandwidth leak in multi-link aggregation failure

This commit snapshots bus->params into m_rt->params_backup for each master
before stream preparation and restores them on failure, while clearing
port lane assignments in sdw_compute_bus_params() when preparing on lane 0.

> diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/s=
oundwire/generic_bandwidth_allocation.c
> index 9bacde2c67a11..214a1be6c33e0 100644
> --- a/drivers/soundwire/generic_bandwidth_allocation.c
> +++ b/drivers/soundwire/generic_bandwidth_allocation.c
> @@ -656,6 +656,20 @@ static int sdw_compute_bus_params(struct sdw_bus *bu=
s,
>  		list_for_each_entry(m_p_rt, &m_rt->port_list, port_node) {
>  			m_p_rt->lane =3D m_lane;
>  		}
> +	} else if (prepare) {
> +		/* Clear stale lane assignments when preparing on lane 0. */
> +		list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
> +			if (m_rt->stream !=3D stream)
> +				continue;
> +
> +			list_for_each_entry(m_p_rt, &m_rt->port_list, port_node)
> +				m_p_rt->lane =3D 0;
> +
> +			list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node)
> +				list_for_each_entry(s_p_rt, &s_rt->port_list, port_node)
> +					s_p_rt->lane =3D 0;
> +			break;
> +		}
>  	}

[Severity: High]
Does clearing m_p_rt->lane and s_p_rt->lane only for the stream currently
being prepared leave stale non-zero lanes on a rolled-back stream when
another stream on the same bus is later prepared or deprepared?

When _sdw_prepare_stream() fails on a later link after bus->compute_params()
has selected m_lane > 0 and recomputed port transport parameters on an
earlier link, restore_params reverts bus->params (including
lane_used_bandwidth[] and curr_dr_freq) while the failed stream remains in
SDW_STREAM_CONFIGURED with its non-zero lane assignments.  If a second
stream on that bus is then prepared or deprepared before the failed stream
is re-prepared on lane 0, sdw_compute_group_params() excludes the
SDW_STREAM_CONFIGURED stream from payload_bw and hwidth, but
_sdw_compute_port_params() still includes it:

drivers/soundwire/generic_bandwidth_allocation.c:_sdw_compute_port_params()=
 {
    ...
				if (!(prepare && m_rt->stream =3D=3D stream) &&
				    (m_rt->stream->state > SDW_STREAM_DISABLED ||
				     m_rt->stream->state < SDW_STREAM_CONFIGURED))
					continue;
				sdw_compute_master_ports(m_rt, &params[i], &port_bo, hstop);
    ...
}

When an active stream uses that same non-zero lane and sample rate,
sdw_compute_master_ports() matches the failed stream's stale p_rt->lane and
advances port_bo without allocated hwidth, shifting active streams' transpo=
rt
block offsets out of bounds.

In addition, bus->compute_params() on the preceding link has already updated
mstr_prop->default_col and recomputed p_rt->transport_params and
p_rt->port_params across existing streams on that bus; if an already
PREPARED or DISABLED stream on that link is later enabled or disabled,
sdw_program_params(bus, false) programs those un-reverted transport
parameters into hardware without recomputing them for the restored
bus->params.

> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 06f051f03a218..7c748ba847672 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1479,19 +1479,22 @@ static int _sdw_prepare_stream(struct sdw_stream_=
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
> @@ -1542,7 +1545,13 @@ static int _sdw_prepare_stream(struct sdw_stream_r=
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
> +
>  	return ret;
>  }

[Severity: High]
Can restoring m_rt->params_backup across all masters desynchronize
bus->params.curr_bank and bus->params.next_bank from hardware when
_sdw_prepare_stream() fails during or after do_bank_switch()?

m_rt->params_backup snapshots curr_bank and next_bank before
do_bank_switch() switches the active register bank in hardware and inverts
those fields.  If sdw_prep_deprep_ports(m_rt, true) subsequently fails on
any master (or if do_bank_switch() fails after an earlier master in
stream->master_list has already switched banks), jumping to restore_params
overwrites curr_bank and next_bank on every master with their pre-switch
values and leaves ports prepared on earlier masters in the loop without
depreparing them.  Later stream operations on those buses will then program
banked registers into the currently active hardware bank and attempt to
switch to the bank already in use.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112072105.1296=
515-1-yung-chuan.liao@linux.intel.com?part=3D5
