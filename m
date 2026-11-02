Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600169;
	b=0gvlI1JacnWT2srKL2RJ+buC7Mb1aAcv+cU/v+0/F8GG8LkXAdALON+4o+bLXpm03Ijm
	 c5Ht96bkgjOZp81T88iTp0vHO4Q+ssI7kBi29Hm22QOK0uempmFj0NafyALJQSz2CvRGb
	 xB7MHxCxJrERJiXuOvytKuIqdUfBztvXR1ICNZqpVyUSRTnpEEugNUfKdTtiCK0qE+Hor
	 zOaLnrB2sNVdLWiyt16DTzQywCAe30E+HIU1XnD+NXDhT+pCzflP8u1WVm000h9CEBXAv
	 VM1E60d2mMPUD9rg8l7uuNqcHyD8BlMgkjWjV8QP1IZfxBrpbtzyiUQAqqEd8tikuwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600169;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OdbvXH9eqAgYpPSF2xfkndckDZ0p3olBY6mP7XaEyUA=;
	b=LqMnan+dgZDp3cFyclG4RGtIYmObT07eUgLS0zczdU7i6ieLV1BNtP9QHTS6OfTKSiTD
	 LzuLdqEgWiznQPQAfozTB0JJZxtevIKrE4HQu8/YblQFJsGc6fANIdb8kripknxIItaVs
	 U9F1ZF0QGwQKs8zFRDG08diyBKgPaPtzAE5n4EkJH4Gywsvc/InTf0AnVsblVCciG314t
	 LK57BiZalCn6t35+fFZNZ05JkJCJDJWOJvuRH+AnHFEgdGfANG7I0+FwTbW+YrKzGqGD9
	 lnIXB2ua79WIoFPGLohsPjs/y7tTZIHhKERuvGMB5f7kxu7U4Vw1O0sPWCN/tqEbq3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kHd2YOaP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2711606A326
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 06:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kHd2YOaP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 498661F000C1;
	Mon,  2 Nov 2026 06:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793600168;
	bh=OdbvXH9eqAgYpPSF2xfkndckDZ0p3olBY6mP7XaEyUA=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=kHd2YOaP3gqzT703YLdgWu6VHRxgxBU42U3U8OT9j5HNSmNfo6Zh4+Gx0W7jutIMG
	 OP+l/sSdNXQpw0j9JqP62N4BWD0LG8LwWFVJNojrvIWmi7CxEh1eAu3mPrCjL0qtBm
	 BBGuxv81HQhr6+6FmuMHE7J3GdA70zMTRXGcAURLHOaGuYruiYYnUmeF0kqvEL/rqQ
	 0mVfMawGfzh23F+d01wP9lwevzuVejd0yVKnH4/kvWzR65DjEW5H1KeyuO8rAWoznk
	 rF2S1V8Qlf5TgQsNxD5DR4qrfSPCqUutRiy7rIi983d0oXrt+268Xvbc5cJzoCAG7k
	 aznSNRai2cMhQ==
Message-ID: <sashiko-outbox-192942@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] soundwire: move lane bandwidth into bus params
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bard Liao" <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261102060437.824814-2-yung-chuan.liao@linux.intel.com>
References: <20261102060437.824814-1-yung-chuan.liao@linux.intel.com>
 <20261102060437.824814-2-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 06:16:07 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] soundwire: unrestored port lanes on error in _sdw_prepare_stream()
--

commit bc8dc54bdb852b57939246f45a1d5ab8025ee456
Author: Bard Liao <yung-chuan.liao@linux.intel.com>

soundwire: move lane bandwidth into bus params

This commit moves the lane_used_bandwidth array from struct sdw_bus into
struct sdw_bus_params so that used lane bandwidth is restored when
bus->params is rolled back on failure.

> diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/s=
oundwire/generic_bandwidth_allocation.c
> index 30a495abe19ea..3d6b9c895e46f 100644
> --- a/drivers/soundwire/generic_bandwidth_allocation.c
> +++ b/drivers/soundwire/generic_bandwidth_allocation.c

[ ... ]

> @@ -507,7 +507,7 @@ static int get_manager_lane(struct sdw_bus *bus, stru=
ct sdw_master_runtime *m_rt
>  					      m_rt->stream->params.bps;
>  		}
>  		if (required_bandwidth <=3D
> -		    curr_dr_freq - bus->lane_used_bandwidth[l]) {
> +		    curr_dr_freq - bus->params.lane_used_bandwidth[l]) {
>  			/* Check if m_lane is connected to all Peripherals */
>  			if (!is_lane_connected_to_all_peripherals(m_rt,
>  				slave_prop->lane_maps[l])) {
> @@ -518,7 +518,7 @@ static int get_manager_lane(struct sdw_bus *bus, stru=
ct sdw_master_runtime *m_rt
>  			}
>  			m_lane =3D slave_prop->lane_maps[l];
>  			dev_dbg(&s_rt->slave->dev, "M lane %d is used\n", m_lane);
> -			bus->lane_used_bandwidth[l] +=3D required_bandwidth;
> +			bus->params.lane_used_bandwidth[l] +=3D required_bandwidth;
>  			/*
>  			 * Use non-zero manager lane, subtract the lane 0
>  			 * bandwidth that is already calculated

[Severity: High]
When _sdw_prepare_stream() fails after sdw_compute_bus_params() has assigned
a non-zero lane via get_manager_lane(), restoring bus->params rolls back
bus->params.lane_used_bandwidth[l] and bus->params.bandwidth, but leaves
the port runtime lane assignments modified:

drivers/soundwire/generic_bandwidth_allocation.c:sdw_compute_bus_params() {
    ...
out:
	/* multilane can be used */
	if (m_lane > 0) {
		/* Set Peripheral lanes */
		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
			slave_prop =3D &s_rt->slave->prop;
			for (l =3D 1; l < SDW_MAX_LANES; l++) {
				if (slave_prop->lane_maps[l] =3D=3D m_lane) {
					list_for_each_entry(s_p_rt, &s_rt->port_list, port_node) {
						s_p_rt->lane =3D l;
    ...
		list_for_each_entry(m_p_rt, &m_rt->port_list, port_node) {
			m_p_rt->lane =3D m_lane;
		}
	}
    ...
}

If a subsequent step fails in sdw_compute_bus_params() (such as
sdw_select_row_col()), sdw_compute_port_params() (such as
sdw_compute_group_params() returning -EINVAL when column_needed > sel_col),
or _sdw_prepare_stream() (sdw_program_params(), do_bank_switch(), or
sdw_prep_deprep_ports()), _sdw_prepare_stream() jumps to restore_params:

drivers/soundwire/stream.c:_sdw_prepare_stream() {
    ...
restore_params:
	memcpy(&bus->params, &params, sizeof(params));
	return ret;
}

With m_p_rt->lane and s_p_rt->lane still set to non-zero values while
bus->params.lane_used_bandwidth[l] is restored to its previous value (such
as 0), won't subsequent calls to sdw_compute_group_params() and
_sdw_compute_port_params() skip computing parameters for those ports when
bus->params.lane_used_bandwidth[l] is 0, and won't _sdw_deprepare_stream()
later underflow bus->params.lane_used_bandwidth[p_rt->lane] and leak lane 0
bandwidth in bus->params.bandwidth?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102060437.8248=
14-1-yung-chuan.liao@linux.intel.com?part=3D1
