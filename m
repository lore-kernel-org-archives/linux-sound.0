Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360608;
	b=io4Vne/3Fgu0sn3PyY22h6pv+CN+ttS5S8Z7qn7VeqiJx59YoeOq1HV8+MdAd1qx30+4
	 veZFpa32UlNff9eZxD46oVWxQq8UX9PLzab3ueDQVjzgUEmE1x41ORSh7fJNh7if2igFz
	 VjTtXGce3oBPq8EPWZID2614MOguhQ+SsV4aZ/Czhqzz6RgH+PKIoeK7w6exFriuxHlkg
	 LtGbBR92F/uv4yKfSbNBO9YudCmJos9xHdXvQCUz3pQQ2EnTDLXVoFEhiyXWv0rdQhlck
	 1EAD97Zhwo7B6sq4ebq3I/GHV3EjQdnAk91GB6/xsTw8cag5zcp+bE4KWCOA/unbtoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360608;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fn/ICSz/VV50wYmbAyMvo0yPwxHWruFKYMHnc0e3Zxg=;
	b=fU95uTEsoqk189YAjnUaSy0qDbF4zh4sTUEj8ki2HpiPOneBEBe2Mw/LAjbHryaweg68
	 jKRolnY6cJYWy1jLISDHMqwVIwbWB/p+N01TDqAxqKrROiDK3YjfbVrsnPu8y8YJdLMIF
	 NrXxnPr8kWMaLG/V9hxD1RnG0xwUPKlyW5Qo6mjzOHO1klXhBShJcqbyyGHjEi3gO0gBZ
	 DSQTzE0uiQsEokx5ZU94Or2VAAYS22AUYjxmrf652uVuE3mRavgGJPasqqqErWxJ17lSX
	 zdWT2J5W6KeLy8We/hZxHLzROKaLNUeGQjV6IeVH9hOj5a7g9WjwqpCMByAZaekNYwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W5PXKIrT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2546606A31A
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 11:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W5PXKIrT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210951F000C1;
	Fri, 30 Oct 2026 11:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793360607;
	bh=fn/ICSz/VV50wYmbAyMvo0yPwxHWruFKYMHnc0e3Zxg=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=W5PXKIrTEh1Zf29v43pd1BJnLxGAE6WNX38RJhxzTRqg08O3V2y8ah8IFwE6DJI64
	 8I/LDXLmgd9Q7ViOmhs2AFNjxvs5sJ4Z2ebBbXfm2zZ9H20tMWP4vwJWHb6h7+fGGs
	 0M1iiSLi6LfWor4Xywd7idsNqxlqFKC7ee/Se3WGqOBwISMFJe+Vv6PO0Z9luJvQMS
	 UwM5fKploOOexsiVvHcXb6l5DkwiOiAVunIsWBCW9jj9YcWzaHv2RGJVh10+X0TkM9
	 0/SDVFRynyxrBECgIdCZxU89xSLpcffqNMiLerlH78BlcV79gM+UP98EKnF8hRXN0W
	 pHxzcKV/OemEQ==
Message-ID: <sashiko-outbox-190944@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/21] soundwire: qcom: Prevent pconfig buffer overflow
 in qcom_swrm_stream_alloc_ports()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, linux-sound@vger.kernel.org
In-Reply-To: <20261030104840.3361217-8-lee@kernel.org>
References: <20261030104840.3361217-1-lee@kernel.org>
 <20261030104840.3361217-8-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 11:43:26 +0000
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
- [High] soundwire: qcom: port_mask leak on error in qcom_swrm_stream_alloc=
_ports()
--

commit 67cffb71aa319b54456dfa761fc2fc2da4b71496
Author: Lee Jones <lee@kernel.org>

soundwire: qcom: Prevent pconfig buffer overflow in qcom_swrm_stream_alloc_=
ports()

This commit adds a bounds check in qcom_swrm_stream_alloc_ports() to verify
that nports is less than maxport before writing to pconfig[nports], prevent=
ing
an out-of-bounds write when more slave ports are requested than ctrl->nport=
s.

> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 6e0c5fb10efad..2050112340302 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1343,6 +1343,11 @@ static int qcom_swrm_stream_alloc_ports(struct qco=
m_swrm_ctrl *ctrl,
>  		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
>  			slave =3D s_rt->slave;
>  			list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
> +				if (nports >=3D maxport) {
> +					dev_err(ctrl->dev, "All ports busy\n");
> +					return -EBUSY;
> +				}

[Severity: High]
Does returning -EBUSY here leak the port allocations in ctrl->port_mask?

In qcom_swrm_stream_alloc_ports(), each loop iteration over s_rt->port_list
sets bit pn in ctrl->port_mask and records pn in the local pconfig array:

	set_bit(pn, port_mask);
	pconfig[nports].num =3D pn;
	pconfig[nports].ch_mask =3D p_rt->ch_mask;
	nports++;

When nports reaches maxport on a subsequent iteration and returns -EBUSY (or
when the pn >=3D maxport check below triggers after earlier iterations alre=
ady
succeeded), qcom_swrm_stream_alloc_ports() returns before calling
sdw_stream_add_master().

Although the caller qcom_swrm_hw_params() invokes
qcom_swrm_stream_free_ports() on error:

	ret =3D qcom_swrm_stream_alloc_ports(ctrl, sruntime, params,
					   substream->stream);
	if (ret)
		qcom_swrm_stream_free_ports(ctrl, sruntime);

qcom_swrm_stream_free_ports() only clears bits in ctrl->port_mask by iterat=
ing
over m_rt->port_list:

	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
		port_mask =3D &ctrl->port_mask;
		list_for_each_entry(p_rt, &m_rt->port_list, port_node)
			clear_bit(p_rt->num, port_mask);
	}

Because m_rt->port_list is only populated inside sdw_stream_add_master() and
pconfig is freed on return, m_rt->port_list is still empty when
qcom_swrm_stream_alloc_ports() fails, leaving all previously set bits in
ctrl->port_mask permanently set.

Should qcom_swrm_stream_alloc_ports() unwind the bits set in port_mask from
pconfig[0 .. nports - 1] before returning -EBUSY?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030104840.3361=
217-1-lee@kernel.org?part=3D7
