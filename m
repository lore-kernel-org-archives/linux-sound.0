Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075731;
	b=REkrZOESL/saPoFlXVQeAxIgc7iJ60VbY3txqp9YeOt+67mWLsMbbXVcuqCiHNNhCoG6
	 OHEv5W/VnuunMwpYUaXFR+zQ5IMdjEHXCxIrF0be0ATPLVWxCJ/MzzGWMwaHRk9da4fuU
	 XZ5yC528V7vdMXwJjb6x1gi6Qe9vP6YKHPnx9zhMAAIijcf/9DGNSJzIvvKfF7USUN1Gc
	 Rxc07U4PzBX9VudmLmdUh4n7/JdXsvnSpEPOIMI+07GmyzBB9133rrKxPrf2Fsry0AeWP
	 z2KCbe7P3/S7EdFQnUIDD2OUt2HdiplsS0q0GH1gDtCBI/wPGXT2AJnsUfUU78IX42Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075731;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CXyZM4JZTnA8hBtpmwmtPC2g0XSFszCEPREBmv4xrPg=;
	b=IM8/DQEIxLrbO8tvVNoqCtjR+y4LdW7VN0Y3jkMGNZpIe7VwekSIj/xY1VHZykr1PXdy
	 bHDOHjIjabNkxbUkKwbceLh9AxfssIDBF4n/LDA8XhckYR2QOJ1INNIpS/2K1kEWiv00h
	 vgw39s8st0P+piGmePrRgqaRtbUoMGsqKZVBuDwkyPPDa2+Sbea18A67M4Ah6V+BtHBQu
	 VudMJ9x6SRiXkMM8l4PysbWBGhSW4f3ctAxJOVd0g4nmx24KAlzygcHDZGyt6KiinH9+t
	 4DpDCVpYjzhn97VSG0E5+6JGulCq+eRZx9vZA4zoY2EMmeah+KQvrAIbRceugww2BfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UC+vCtYZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1EE606A320
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 08:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UC+vCtYZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02ACE1F000C4;
	Thu, 19 Nov 2026 08:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795075731;
	bh=CXyZM4JZTnA8hBtpmwmtPC2g0XSFszCEPREBmv4xrPg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UC+vCtYZ5r1U25f+g7TtXiK0uwQN0FAihKhQhG1fDdgF3e8wTUmaJG5dLdbZ6ga9A
	 XUc0gIVxNv6w0QVf08bZjkiQrwkht1e5BOCMuH30hN2j82EghBe5Gq4JeRTsa6mqVF
	 vMBOILj2ib6+L8+LFgmXFDRWgxT2AT5Og/O3isXgV3neZvusMY+UvXgI02z4/vNDM3
	 bVl8gJYSGtB1qj3j4GeJoERsgKfljGG/LtBIhmKOVGeYykv7SCTWSGaD2MvxsiP1uQ
	 6qX6dfZPBQLUXpFHV0M9upEFCPyRwvjBRxUnzVLdwZ38oz1jgsrKNWDl1mITBZNgOG
	 n4dl4Wn0K2TGA==
Message-ID: <sashiko-outbox-222644@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: audio-graph-card2: Release multi-link ports
 references
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261119075815.50155-1-zhujun2@cmss.chinamobile.com>
References: <20261119075815.50155-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 08:08:50 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] ASoC: audio-graph-card2: double of_node_put() in
  graph_link_init() [1]
--

commit bb6eb5c362dba929e29a53d648672a0c04801536
Author: Zhu Jun <zhujun2@cmss.chinamobile.com>

ASoC: audio-graph-card2: Release multi-link ports references

This commit uses __free(device_node) to release temporary device_node
references returned by port_to_ports() in graph_parse_node_multi_nm() and
graph_counter().

> diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/au=
dio-graph-card2.c
> index d2f32a3a5b28d..245a822c33586 100644
> --- a/sound/soc/generic/audio-graph-card2.c
> +++ b/sound/soc/generic/audio-graph-card2.c
> @@ -559,9 +559,10 @@ static int graph_parse_node_multi_nm(struct simple_u=
til_priv *priv,
> =20
>  		struct device_node *mcodec_ep_n __free(device_node) =3D of_graph_get_r=
emote_endpoint(mcpu_ep_n);
>  		struct device_node *mcodec_port __free(device_node) =3D ep_to_port(mco=
dec_ep_n);
> +		struct device_node *ports __free(device_node) =3D port_to_ports(mcodec=
_port);
> =20
>  		ret =3D -EINVAL;
> -		if (mcodec_ports !=3D port_to_ports(mcodec_port))
> +		if (mcodec_ports !=3D ports)
>  			break;
> =20
>  		for_each_of_graph_port(mcodec_ports, mcodec_port_i) {

[Severity: Critical]
This problem wasn't introduced by this patch, but in the multi-link node
handling in graph_link_init(), doesn't passing multi_cpu_port and
multi_codec_port to graph_get_next_multi_ep() cause a double of_node_put()
on port_cpu and port_codec [1]?

sound/soc/generic/audio-graph-card2.c:graph_link_init() {
	struct device_node *port_cpu =3D ep_to_port(ep_cpu);
	struct device_node *port_codec =3D ep_to_port(ep_codec);
	...
	if (graph_lnk_is_multi(port_cpu)) {
		multi_cpu_port =3D port_cpu;
		ep_cpu =3D graph_get_next_multi_ep(&multi_cpu_port, multi_cpu_port_idx++);
		of_node_put(port_cpu);
		port_cpu =3D ep_to_port(ep_cpu);
	}
	...
	if (graph_lnk_is_multi(port_codec)) {
		multi_codec_port =3D port_codec;
		ep_codec =3D graph_get_next_multi_ep(&multi_codec_port, multi_codec_port_=
idx++);
		of_node_put(port_codec);
		port_codec =3D ep_to_port(ep_codec);
	}
}

graph_get_next_multi_ep() calls of_node_put(*port) before replacing *port
with of_graph_get_port_by_id(ports, idx).  Because port_cpu and port_codec
still hold the initial node pointers acquired by ep_to_port(), the
subsequent of_node_put(port_cpu) and of_node_put(port_codec) calls in
graph_link_init() drop those same references a second time, underflowing
the device_node reference counts and leading to use-after-free.

[1] https://sashiko.dev/#/bug/linux-cfb81a5c-4dcd-4040-99a5-4886fa74927e

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119075815.5015=
5-1-zhujun2@cmss.chinamobile.com?part=3D1
