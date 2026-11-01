Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793558080;
	b=HbiRfk6J9PV1OUgs/XJOA75LZlKw+0L7DH7LY8z7xXot1JSyKU34yibuTJ46qNJYIjEI
	 tOAiKdDbxdIZcySR9vciPEdRQwLLRbS3PJ4ycaMBlmtVcN2iChwwMnE/xZnjf23YuP8q9
	 XlPGtEqd1kNnvNMNWXdrPgkxxBrL8n5iNq5Kg64pilV+TprPkMUSdQMDrJqhDRiQpujlX
	 kFNsu5b8lNZjItM0lr2gVq3HG2/ebTeCYXHVmWUfewx2tvj78B/Y9HNm8ZjaegUN/OGZk
	 uShreEePWBxXcexyhpedEPaDQy/zZrXoFgw4J21CUOOyW6t7M+F/CfUnxAbacdbp9iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793558080;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Nvp6wrPgoh5cGvPGRWSRB6p50iQcFbqgLtkhm6dJFRg=;
	b=EnRnPELdczAYld7R3waYIXbjAnn879+nxY4+rhCxWPbtF750r93+KIjNrTlyIn6vzFVJ
	 qej/dl9Hkwtd2eXOxGKiAnuByXJIZ9L9vf8ZLKDQldciCqgGsMqCZTfFScsfvklLSkT5U
	 ou2jv1tYVB7meYla5HwHyKgUfaHPazEi/n7expUoQyngxzEHFm49S5MltN9ou6ewn4vkj
	 NiZreOlUufOLuFYYzc6hdEtWT5EO8Y7BzDuPzxu0IIOhE4jrZMm/H7NAm1Lhuxoc6qnwK
	 oJ7Di1A5JcK9ZEhGRW9QlkhX2J9AvqMFQbwYgcwQJoT641hS1FRbsJXTe4Kjf+GXzbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k5UAneQL;
	arc=none smtp.remote-ip=95.215.58.155
Received: from mta1.migadu.com (out-155.mta1.migadu.com [95.215.58.155])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2B9606A326
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 18:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A2B9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k5UAneQL
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=emt4OjL+/LipNW4IZBhyCSOLLno50wg5Z9yLtDcIYpw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793558076; v=1; x=1794162876;
 b=k5UAneQLLz99EMXdbRdDYylkD/Ltuw5iJ0Vfk9NjQhtm+3p3EdSgWBcaObY8kg4Rm5swY6rd
 HnFWaSy0WVh85lrSRJHhSPpX3jmRB6n0WI9B09TbBDXEgo8HUZe2hOY2qD8e3WS63W+uuEv8ILP
 hjWrxc+W3E3EGqqZhhub4x+A=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9dbb22a9bc9b35b4;
	Sun, 01 Nov 2026 18:34:36 +0000
X-Mizu-Trace-ID: 9dbb22a9bc9b35b4
X-Migadu-Flow: FLOW_OUT
Message-ID: <fe3eecdc-eb7f-4b1a-947c-fa05c4602fd1@linux.dev>
Date: Sun, 1 Nov 2026 19:24:08 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/16] ASoC: amd: acp: add ACPI machine tables for
 ACP7.F SoundWire
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 Mario.Limonciello@amd.com, Richard.Gong@amd.com, Poojitha.N@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
References: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
 <20261030094714.1123396-14-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261030094714.1123396-14-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/26 10:45, Vijendar Mukunda wrote:
> Add amd-acp7x-acpi-match.c with four snd_soc_acpi_mach entries for
> ACP7.F SoundWire configurations:
> - RT721 + RT1320 on SoundWire links L0+L3
>   (jack+dmic on RT721, spk on RT1320)
> - RT721 + RT1320 on SoundWire links L0+L1
>   (jack+dmic on RT721, spk on RT1320)
> - Standalone RT721 on L0 (jack, amp and dmic endpoints)
> - Standalone RT722 on L0 (jack, amp and dmic endpoints)
> 
> RT721+RT1320 combo configurations use jack_dmic_endpoints for RT721,
> skipping the internal amp since RT1320 provides amplification on a
> dedicated SoundWire link.

[...]

> +static const struct snd_soc_acpi_adr_device rt721_l0_single_adr[] = {
> +	{
> +		.adr = 0x000030025d072101ull,
> +		.num_endpoints = ARRAY_SIZE(jack_dmic_endpoints),
> +		.endpoints = jack_dmic_endpoints,
> +		.name_prefix = "rt721"
> +	}
> +};
> +
> +static const struct snd_soc_acpi_adr_device rt721_l0_only[] = {
> +	{
> +		.adr = 0x000030025d072101ull,
> +		.num_endpoints = ARRAY_SIZE(jack_amp_dmic_endpoints),
> +		.endpoints = jack_amp_dmic_endpoints,
> +		.name_prefix = "rt721"
> +	}
> +};

nit-pick: The naming conventions aren't self-explanatory and don't match
the explanations above. The difference between l0_single_adr and l0_only
are related to the endpoints used, and they don't match what's used for
rt722 below.

[...]> +static const struct snd_soc_acpi_adr_device
rt722_l0_single_adr[] = {
> +	{
> +		.adr = 0x000030025d072201ull,
> +		.num_endpoints = ARRAY_SIZE(jack_amp_dmic_endpoints),
> +		.endpoints = jack_amp_dmic_endpoints,
> +		.name_prefix = "rt722"
> +	}
> +};
