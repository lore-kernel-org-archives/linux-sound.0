Received: from MTA-08-4.privateemail.com (mta-08-4.privateemail.com [198.54.122.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22E91FF7C5;
	Mon,  6 Jul 2026 22:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.122.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783376562; cv=none; b=uAkM9W/Oz0GaM8F5cCTlED9rNZm/k0eWsDwYg7tObp8hIPmoBfbWcoHj3fSmn5ibT2jvox02+ITOLZItEFw5MOBiCQsiI15ReBNjyQJnuSCODSrnODO0DmdbURZOneT9J82pJ0W0GA+ZNnInr2X+Hij6wmxD2pfNuxR5wUgThEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783376562; c=relaxed/simple;
	bh=50IfJsqbSziDTQGOghMsfX/YJEkQsD59smdfs3Dwjjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f6AnQ3TABcwv37hjgYpmm4KbHj/xS3uibSRpG3F5ilsCYWRKZPlUVJNC5wwGg1vWa2twOCLLrh5bMXXaMPUvti//Dq8FhZppyNRgmSYheNlruPiUqI2FCcGqbeCC/0DOxDWuJyDHdIbumc6HYijFZzuIIeJKe4j8DNfUBLJgaqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.122.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from mail.privateemail.com (K8S-PROD-WORKER-10 [87.215.145.39])
	by mta-08.privateemail.com (Postfix) with ESMTPA id 4gvJkc59Tmz3hhTH;
	Mon,  6 Jul 2026 18:22:16 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: add the Qualcomm WCD9378 audio codec
Date: Tue,  7 Jul 2026 00:22:08 +0200
Message-ID: <20260706222209.180391-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <958c9287-b606-497b-9de5-e73984b0f70b@kernel.org>
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net> <20260706192229.144137-3-jorijnvdgraaf@catcrafts.net> <958c9287-b606-497b-9de5-e73984b0f70b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 6 Jul 2026 22:17:56 +0100, Srinivas Kandagatla wrote:
>> +properties:
>> +  compatible:
>> +    const: sdw20217011000
>
> Interestingly this same codec with same compatible is wiredup
> differently on compute devices like Glymur but only with one slave,
> rather than tx and rx. This is how the codec works in SDCA mode.
>
> So these binding would need some room to accommodate those changes.

Good to know, thanks - the Fairphone 6 uses the split RX/TX wiring
throughout, so the single-slave SDCA presentation wasn't on my radar.

For v2 I would reword both binding descriptions so the split wiring is
one of two presentations of the chip rather than the only one, keeping
the port-mapping properties optional, so a single-slave node with neither
property still validates against this schema. The parent
qcom,wcd9378-codec binding then documents the split wiring only
(presumably SDCA mode has no parent node aggregating two slaves).

Given the single-driver exploration you mentioned on patch 3/3, I'll
keep v2 minimal on this point (reworded descriptions, mappings
optional). If the Glymur wiring turns out to need more room
reserved here, happy to shape it so the compute devicetrees don't need a
binding rework later.

>> +  qcom,tx-channel-mapping:
>
> Do you need these channel mapping(both tx and rx), are they different to
> what slave ch-map is?

They only remap the master-side channel masks; the slave-side channel
map is fixed in the driver. Both properties were inherited from
qcom,wcd937x-sdw.yaml, and the Fairphone 6 doesn't use them (the
defaults match the downstream tx_swr_ch_map). So not needed today -
v2 will drop both properties and the driver parsing for them; the
qcom,pm4125-sdw.yaml binding likewise documents no channel mapping
(though that driver still carries the parsing). They can come back
with a board that actually needs the remap. (Dropping
the parsing also removes the static ch_info mutation the bot review
flagged, superseding the devm-copy fix promised in that triage.)

>> +    items:
>> +      enum:
>> +        - 1  # WCD9378_SWRM_CH1
>> +        - 2  # WCD9378_SWRM_CH2
>> +        - 3  # WCD9378_SWRM_CH3
>> +        - 4  # WCD9378_SWRM_CH4
>
> What is this enum imply? channel mask? or ch-index?

A 1-based master channel index; the driver converts it to a bit mask
(BIT(index - 1)). Same semantics as wcd937x-sdw, and moot in v2 with
the properties gone.

Thanks,
Jorijn
