Received: from omr012.pc5.atmailcloud.com (omr012.pc5.atmailcloud.com [103.150.252.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CB979CD
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 08:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736153612; cv=none; b=qnyz9z2qR3g+eiS1MoCd02IessX2SMKGyHOHKCy3qg0dGX1B7QlAzd1tjefFnULhSkoTmSSPwcKSl/mkY9Hl6ZPhn8fSh4zbHtds4drLCh/3k86hlDMHjqTLYYQglvP+FMbnEm9HVmMPPslYUXDlbYGdX71xdF4uDW3BAJprOWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736153612; c=relaxed/simple;
	bh=T+9u0jslqIqw6PuYHyI5mEstMbQW/BkD6UuN1toPrnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=N/Lp/jv4pXGRVNBUKfq2EMUbx6FjFPIcnfdFVbjpMiM+QYSGACqxHZe54zbTFuTHApp7ofoh1jKeSM5pKmWz+bs9jdxIqPS8YhJv6uDJ4zFEY8vqeqq7PEe82uKfrsM6O/0WURxJpV8OHeNxC8F+YKSMjVKeM9jMwiPwJja/E+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au; spf=pass smtp.mailfrom=iinet.net.au; dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b=Dfc14ml7; arc=none smtp.client-ip=103.150.252.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b="Dfc14ml7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iinet.net.au; s=202309; h=Content-Type:From:To:Subject:MIME-Version:Date:
	Message-ID; bh=NHWNmUUZA+OhLgOSVGFWUWiGGEwJNu5+mJYgjPhvjX0=; b=Dfc14ml76mcT6F
	w7tqnePJAEv8Zpo1+UNS1lUNT0d+ld2MkGB8Qxkde9HlkQnzfQXCfQc9NeE5r6lKb0E97iZm73gaN
	V/pMChXdMkacDpHwC6z+SuxMfSbBvfrFJaQ/BNIVgDU1v0smQZOkQeSfuL1UVr5B3ClqWvkRHxXBO
	IlG67RAqaW7fbWxSuzchSoSFjTfI6CIx6s2EetsX79mwUYQjBKjLEFE/iW7NSdz5fpdn04bYbPcuN
	7WoKxyaX5cfpQXKsH99iZBhIbG1URwxkITXcWd7krIwdp1DuKMiVpo943Uk7+kjIriNI0qe3OFzeV
	pIIBlU2KVzdaEE70a84Q==;
Received: from cmr-kakadu03.internal.pc5.atmailcloud.com (cmr-kakadu03.internal.pc5.atmailcloud.com [192.168.1.5]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu03.i-00c96a0c3c073041d) with ESMTPS
	(envelope-from <gordoste@iinet.net.au>)
	id 1tUirV-000000004ep-41AC ;
	Mon, 06 Jan 2025 08:53:25 +0000
Received: from [220.233.184.101] (helo=[192.168.20.101])
	 by CMR-KAKADU03.i-00c96a0c3c073041d with esmtpa
	(envelope-from <gordoste@iinet.net.au>)
	id 1tUirV-000000004ax-2HyM;
	Mon, 06 Jan 2025 08:53:25 +0000
Message-ID: <02b6d112-e4bf-4bc7-8cee-6d6fcd4df5e4@iinet.net.au>
Date: Mon, 6 Jan 2025 19:53:18 +1100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] ASoC: extra format on each DAI
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org
References: <87zfk4o5l2.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Stephen Gordon <gordoste@iinet.net.au>
In-Reply-To: <87zfk4o5l2.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Atmail-Id: gordoste@iinet.net.au
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=UvxlNfwB c=1 sm=1 tr=0 ts=677b9a05 a=HSUqTxjWRdnMbJspRni59w==:117 a=HSUqTxjWRdnMbJspRni59w==:17 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=x7bEGLp0ZPQA:10 a=4jraHwQkAAAA:8 a=7OV1BVwYYWXDsmRpvOgA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
X-Cm-Envelope: MS4xfFVAeA+5AKUa/ZZkXPtMy9Fygfvtd8BMvXMk1Q9Xtn1LaW1fTJuGyxQ8iSu2drsZl+cWVNvW6PIFT3YfN/uGs2A3+cNiVjAGLpw5CV/KuCEeCEjyoa1K zPowniSz7VBNJOAnBkm0itW8oTuj9OmAD1fsjm7G2g8Pgq0YtadM4pbcChxGQ2pCCpE3U+Gx52gu4ZdEnkKyxwxTpGXvhzLBxQk=
X-atmailcloud-route: unknown

On 6/01/2025 4:48 pm, Kuninori Morimoto wrote:

> This patch-set needs Stephen's Tested-by
> 
> Kuninori Morimoto (7):
>        ASoC: audio-graph-card2: use __free(device_node) for device node
>        ASoC: audio-graph-card: use __free(device_node) for device node
>        ASoC: simple-card: use __free(device_node) for device node
>        ASoC: soc-core: return 0 if np was NULL on snd_soc_daifmt_parse_clock_provider_raw()
>        ASoC: audio-graph-card2: use of_graph_get_port_by_id() at graph_get_next_multi_ep()
>        ASoC: soc-core: Enable to use extra format on each DAI
>        ASoC: audio-graph-card2: Use extra format on each DAI
> 

All patches:

Tested-by: Stephen Gordon <gordoste@iinet.net.au>


Thanks

Stephen
