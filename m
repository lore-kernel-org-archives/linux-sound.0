Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793558081;
	b=3YqyA46yCo9kl86M2i8jyaiIRb6LIvdl7iDK49ngJGPoPlrGStt/QyMzlD+9xZWYWGK9
	 zevnBzR1CRTgmmPtXbo5wacGvkyjdhtV3maKg/rUANJ/da4ERlcz+Vaq5PLGomjvGwRD7
	 srvwbQLp/AqW+F/GsfideHwacD/hC+1G91eoKEdXChfp9dDhl3p7g+/psv1gIU8WYFEMp
	 GEwo4B9CjUianQFNZx4+s7vKDzQ4jHk0bwAwU2l9L5yuLu+LiGd4uvbfGeROcXUeb1ku+
	 J19cyS/SPhAZKNNJyZj0AMnkfFrgf2ZnS43Otnin8O5j98/jay7R8u/GWdBaU0paypg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793558081;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=roEXKHV3bSn32NXO5iU8AkavaOFDLM6xVfv3zpHRTqg=;
	b=a+SjslSaXDwusMeUM3Omjjy5ORFuhp542za2SSj2QgXCpmK8Od6uheVLs5S/MfUaThTF
	 91VGd9tOzdE1oWsMlS4wpdQteO4NZw2cdLQ++a28WYsljkxcu9Nj77P0Ockc0d/NERXQp
	 v6kEbFwiuwbxPj1vLxNZA/kU+tjzwiCwhtZ8OtDzI/kuYSuBdfZ5O6JcOXEUG39kk/SWM
	 YWjAnXUPUT/9HxB7zOzA1SSJoN+OD/lDNqNkKok0f0qz5lgy+deLpWp0VGqt37gJVVXKs
	 GHDQRHDFNjaCDNpZ/XmmLZn9C0OlaFGD2jp3VTmZ+jYTWfC5h/Ls0vdjMCb1WsfMBSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OXTITvZm;
	arc=none smtp.remote-ip=95.215.58.172
Received: from mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE794606A32D
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 18:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE794606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OXTITvZm
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cW6qKgzk8mxeXA6HkHDZMcqXE+l3PrzoIeWlvKUlAVY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793558079; v=1; x=1794162879;
 b=OXTITvZmoqcO3dDgGWla5y0xv9IGreFGH2Gi8UMx87blhOSHIyXtEesRvLW38aql2q+DU20w
 NgObbUKfHhhSa6y2MgIRRlKMU/K7sgSt281Wt9cNrJr1HTJzGHez1F8AUw0/4gdDG61+92nA+vD
 GeLzDUn10pzJY09rQvCREKrM=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 53ac8b846c1ec72b;
	Sun, 01 Nov 2026 18:34:38 +0000
X-Mizu-Trace-ID: 53ac8b846c1ec72b
X-Migadu-Flow: FLOW_OUT
Message-ID: <3f3d7e4b-dd5a-4ef9-806e-5bc98a40d2d3@linux.dev>
Date: Sun, 1 Nov 2026 19:34:20 +0100
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
Subject: Re: [PATCH v4 00/16] ASoC: amd: acp: ACP7.B/7.F SoundWire machine
 driver support
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 Mario.Limonciello@amd.com, Richard.Gong@amd.com, Poojitha.N@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
References: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/26 10:45, Vijendar Mukunda wrote:
> This series adds SoundWire machine driver support for ACP7.B and ACP7.F
> platforms. It extends the existing AMD ACP SoundWire infrastructure with
> per-platform CPU pin ID lookup, PDM controller selection via ACPI and DMI
> quirks, DMIC DAI link and components string handling, PCI subsystem ID
> propagation, and ACPI machine tables for RT721/RT722/RT1320 codec
> configurations on both platforms.
> 
> Changes in v4:
>   - Patch 1: fix missing asoc_sdw_mc_dailink_exit_loop() cleanup on
>     devm_kasprintf() failure in acp-sdw-sof-mach.c mc_probe() (new).
>   - Patch 2: fix missing asoc_sdw_mc_dailink_exit_loop() cleanup on
>     both devm_kasprintf() failure paths in acp-sdw-legacy-mach.c
>     mc_probe(); update commit message to reference the correct function
>     name soc_card_dai_links_create() instead of sof_card_dai_links_create()
>     (new).
>   - Patch 3: remove unused ACP63_SDW_MAX_CPU_DAIS define (new).
>   - Patch 5 (was 2): add comments above ACP7X_SW_AUDIO* define block
>     and get_acp7x_cpu_pin_id() to document the dedicated per-port DMA
>     layout and the port-to-use-case mapping.
>   - Patch 9 (was 6): replace misleading "No functional change" claim
>     with an accurate description of the behavioural change for platforms
>     where ignore_internal_dmic is true (dmic_num now stays zero at the
>     gate rather than reaching the dmic_num > 0 block).
> 
> Changes in v3:
>   - Patch 3: update subject and changelog to accurately describe the new
>     PDM controller selection infrastructure being added.
>   - Patch 5: fix commit subject prefix from "amd: acp7x:" to "amd: acp:"
>     since the change is in the generic ACP SoundWire machine driver
>     (acp-sdw-sof-mach.c), not the ACP7x-specific SOF driver.
> 
> Changes in v2:
>   - Patch 6: simplify the DMIC enable condition as suggested by Pierre:
>     evaluate the three-way boolean once and nest the ignore_internal_dmic
>     check inside, avoiding the double-tested condition from v1.
> 
> Vijendar Mukunda (16):
>   ASoC: amd: acp: fix missing cleanup on devm_kasprintf() failure in
>     mc_probe()
>   ASoC: amd: acp: fix missing cleanup on devm_kasprintf() failure in
>     legacy SDW machine driver
>   ASoC: amd: sdw: remove unused ACP63_SDW_MAX_CPU_DAIS define
>   ASoC: amd: acp: add ACP7.B/7.F SoundWire link count for machine driver
>   ASoC: amd: acp: add ACP7.B/7.F SoundWire DAI link support
>   ASoC: amd: acp: add PDM controller selection for ACP7.B/7.F SoundWire
>     machine driver
>   ASoC: amd: acp: log ASOC_SDW_ACP_DMIC1 quirk in SOF SoundWire machine
>     driver
>   ASoC: amd: acp: enable DMIC DAI link based on PDM controller selection
>   ASoC: amd: acp: move ignore_internal_dmic gate to DMIC enable
>     condition
>   ASoC: amd: acp: add DMIC components string for SOF SoundWire machine
>     driver
>   ASoC: amd: acp: set PCI subsystem ID for SOF SoundWire machine driver
>   ASoC: amd: acp: fix MODULE_AUTHOR missing closing angle bracket
>   ASoC: amd: acp: add ACPI machine tables for ACP7.F SoundWire
>   ASoC: SOF: amd: add alt_machines for ACP7.F SOF SoundWire
>   ASoC: amd: acp: add SoundWire machine table for ACP7.B platform
>   ASoC: SOF: amd: register SoundWire alt_machines for ACP7.B
> 
>  sound/soc/amd/acp/Makefile               |   2 +-
>  sound/soc/amd/acp/acp-sdw-legacy-mach.c  |   8 +-
>  sound/soc/amd/acp/acp-sdw-mach-common.c  |  48 ++++++
>  sound/soc/amd/acp/acp-sdw-sof-mach.c     | 109 +++++++++++--
>  sound/soc/amd/acp/amd-acp7x-acpi-match.c | 198 +++++++++++++++++++++++
>  sound/soc/amd/acp/soc_amd_sdw_common.h   |  45 +++++-
>  sound/soc/amd/mach-config.h              |   2 +
>  sound/soc/sof/amd/pci-acp7x.c            |   2 +
>  8 files changed, 396 insertions(+), 18 deletions(-)
>  create mode 100644 sound/soc/amd/acp/amd-acp7x-acpi-match.c

For the patchset:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

I added two nit-pick comments on naming and DMIC0/DMIC1 explanations, in
case you respin a v5.
