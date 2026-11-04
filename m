Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776212;
	b=a1rHA+xiGTu4je7JGsuHXkFT27QfFInYMpVwgz1r9hMn7zv6lmtR1EiyO+DBRDPvUlEi
	 lLjGMk9QvKaRvcMPYj47aFk+8PyzwNf03x+HsAanEGPTsAywSdldgtGPq55pTsZSs1La/
	 Xe0GRGWtqMoQeRPnyPzFiB8BidzrHEHVecSNAH/Lq2qN57YjRgAa05GhD7jnKLtAYJGhl
	 fTJV15Wm5Cg4YZQRq4irhMPtd8x66PNZtibdZczNFdRJ9AfupiN3ZOX9LjVTHh0ApnMyQ
	 Wt/2dZ9nsT14lTiXD8zGKw/i2UFBJpf9Wnp0Y7SwjWqhzzWg7GQYvoz7kiETbk94Uug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776212;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NMYNB9COF46oh5WnNHwes5NR7sSly5pD5TV0jSzxyfc=;
	b=hiF8bTemmSZsZilT1sw1djEWAlcqR+juGfQvKxsv1WAFajoK5Yzslusph2gNK+Z84+te
	 9sQM6DbZ6DQ+C6LGwdDMYosvJi3DOXzpa5DO5orSYIUMoF3a229lC9pkfiI1lkFBbNwaA
	 R/vppZBkksCHnyqjcDqHFdqBC+g9PDBJrCrKaDus/OmvdZwkrRrA4n4RcssPBBEGMvE2y
	 AQmxIzh+okWpysN/saJ2Yly64ggwAHw+/zmLK62gWMe1eFJwlnCZNtuiOxaYi2eeOtVmk
	 RjBoAo4hDafOodrdLu1Z4aLBP3gic4/kPFHJv9/ToH6qDYzEopqWl4XzrOcK/DZUc0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ya9nnf2l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB38606A31B
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 07:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ya9nnf2l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4B11F00919;
	Wed,  4 Nov 2026 07:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776212;
	bh=NMYNB9COF46oh5WnNHwes5NR7sSly5pD5TV0jSzxyfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ya9nnf2lXxnUl4w9Brnl5zOag7F6DSPrjaNubAxn0GmbNo9ChtaoPbg+38cH3kwSS
	 VB1cN2gXkHj5qu0x6Q4rW6rTFe8YESZNhjy0LVUPx/6YVm1bBD5tuveblpnJX6JnGs
	 7ssHq16pKKyd9QCv0ct/Llwl6JiTRvAe3dEwqK1OMr5xT5CcQUP3K82g/z0tQ0qOoF
	 jIQl5uDs4kOMH3HPJuW0rLmgZRjSN3vrW1obmMcZ62vfJrExRofZ+mMqWBYXUxfkOp
	 PufjoIJtIJ6pfE+etIrT8SZg+XT9eEjGqtUrq3kysJzNYrZrpVbsbPBmHGPnjLNsW0
	 xcl7UDRrUamcQ==
Date: Wed, 4 Nov 2026 08:10:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: audio-graph-card2: fix device node leaks in
 graph_count_c2c()
Message-ID: <20261104-vengeful-impartial-chipmunk-0c8a8e@quoll>
References: <20261104024055.1508771-1-vulab@iscas.ac.cn>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104024055.1508771-1-vulab@iscas.ac.cn>


On Wed, 04 Nov 2026 02:40:55 +0000, Wentao Liang wrote:
> graph_count_c2c() takes two references that it never drops: the one
> from of_node_get(lnk) stored in port0, and the extra one added on top
> of the reference of_graph_get_next_port() already returns for port1.
> Both nodes are leaked once per codec2codec link parsed at probe time.
> 
> Release port0 with the cleanup attribute and drop the redundant
> of_node_get() around the port1 lookup, so that the cleanup attribute
> balances the single reference of_graph_get_next_port() returns.  This
> is the same ownership model audio_graph2_link_c2c() uses.
> 
> Fixes: 5f281c3e82b1 ("ASoC: audio-graph-card2: use __free(device_node) for device node")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  sound/soc/generic/audio-graph-card2.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email address, thus I doubt that we
   speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document the issue discovery method and what was
or was not tested.

Best regards,
Krzysztof




