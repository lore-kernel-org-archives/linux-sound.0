Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF3F36C9DA;
	Wed, 11 Mar 2026 16:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773247088; cv=none; b=jtPVW3iZ+NUgj2VQFA7RWMUcKGOcTk/J+iTji5klL2LkKgNlzS6BkTgzQU0yllXIYYM2QC3OubMjlfOX5DEcDLt19bENaPtGy7Ncr9OVidvv+Fj6mgV9NvYwHfcgf2i0vBWkuKbU4d0r/luy0oD5j9qVRBWlqavM1H94uIpBe/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773247088; c=relaxed/simple;
	bh=godgHy1cnZkwqUfjFAAGcq5uKPPjThfM6GDP8uFItv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Psl1Sycf3AbI13olTXu0vVZ62xYYeRUuCCDB0FBXbUfv4fUDx9Kybv9HODTGdxpNkAAgyReq355EHCT41c9s1Dzh4ow2mVA9+fhIXvEpAD8A7+ifSHP8dj6Ot2OBll/bPe60DF+MNd0u9VKzUdQWvTHlNVKHuyi39tUehOUVlEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fT6qfhLi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fT6qfhLi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E8B7C4CEF7;
	Wed, 11 Mar 2026 16:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773247088;
	bh=godgHy1cnZkwqUfjFAAGcq5uKPPjThfM6GDP8uFItv0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fT6qfhLiy5S0IevQUnX6jG2X6uWEbR8fzgg/dkIV/1jXTJ9hA/Mtz81LRG/L5DtPR
	 LkNMmgH4W9uMJNeCxIsY7/X7cUOn5U6Dn5e7P/9o9Oii2OunCkCNfXadENtGOBpBDg
	 MN38HS+WFjJQA6yZQkUbwmdsup3J7Ur85BCYywCkQn2xAtAR4z6A2uOEiBEUmrYcnN
	 gUxychcX6OlAQCW5lk1lZ6qblnahyprHM9AKxJyMIlA+O3e9tu4jHBYGHvO8+2XcaC
	 47fM6Ii+xBnMQLs0FxkkMYV3o/lo4TWPd2+eADcGJHnRSXsfBwLNoFyTapNVZ2Mh26
	 of5mN1FD5md+w==
Message-ID: <2a1ef87f-09b7-4763-a580-c65ddabbcf79@kernel.org>
Date: Wed, 11 Mar 2026 17:38:03 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: codecs: aw88166: Support device specific
 firmware
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Weidong Wang <wangweidong.a@awinic.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260310-aw88166-fw-v1-0-2777563bb673@gmail.com>
 <20260310-aw88166-fw-v1-2-2777563bb673@gmail.com>
 <20260311-glittering-elastic-deer-a2fa58@quoll>
 <CALHNRZ-KxT0B1zpPD1N7ba6185cqh6q-z-WMxbpU68FRuGJXEA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CALHNRZ-KxT0B1zpPD1N7ba6185cqh6q-z-WMxbpU68FRuGJXEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/03/2026 17:30, Aaron Kling wrote:
> On Wed, Mar 11, 2026 at 8:15 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Tue, Mar 10, 2026 at 11:43:05PM -0500, Aaron Kling wrote:
>>> From: Teguh Sobirin <teguh@sobir.in>
>>>
>>> This driver currently loads firmware from a hardcoded path. Support
>>> loading device specific firmware when provided by the boot firmware.
>>>
>>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
>>> Co-authored-by: Aaron Kling <webgeek1234@gmail.com>
>>
>> There is no such tag.
> 
> What do you mean? This tag is used all [0] over [1] the kernel [2].

git grep for it.

Other references are mistakes.

> How else is one supposed to indicate that that notable changes have
> been made since the original author touched it?

The tag which is already documented and explained in submitting patches.

> 
>> Also, incomplete DCO chain.
> 
> Ack, will fix. And somehow b4 didn't catch it, huh. Pretty sure I've
> seen it catch this elsewhere, though.
> 
>>> ---
>>>  sound/soc/codecs/aw88166.c | 19 +++++++++++++++----
>>>  1 file changed, 15 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
>>> index daee4de9e3b01fb335975a65456cc79575533d7e..52d33a2f7cb12877138ea5083ad42e2777f8d323 100644
>>> --- a/sound/soc/codecs/aw88166.c
>>> +++ b/sound/soc/codecs/aw88166.c
>>> @@ -1574,18 +1574,22 @@ static int aw88166_dev_init(struct aw88166 *aw88166, struct aw_container *aw_cfg
>>>  static int aw88166_request_firmware_file(struct aw88166 *aw88166)
>>>  {
>>>       const struct firmware *cont = NULL;
>>> +     const char *fw_name;
>>>       int ret;
>>>
>>>       aw88166->aw_pa->fw_status = AW88166_DEV_FW_FAILED;
>>>
>>> -     ret = request_firmware(&cont, AW88166_ACF_FILE, aw88166->aw_pa->dev);
>>> +     if (device_property_read_string(aw88166->aw_pa->dev, "firmware-name", &fw_name) < 0)
>>> +             fw_name = AW88166_ACF_FILE;
>>> +
>>> +     ret = request_firmware(&cont, fw_name, aw88166->aw_pa->dev);
>>>       if (ret) {
>>> -             dev_err(aw88166->aw_pa->dev, "request [%s] failed!\n", AW88166_ACF_FILE);
>>> +             dev_err(aw88166->aw_pa->dev, "request [%s] failed!\n", fw_name);
>>>               return ret;
>>>       }
>>>
>>>       dev_dbg(aw88166->aw_pa->dev, "loaded %s - size: %zu\n",
>>> -                     AW88166_ACF_FILE, cont ? cont->size : 0);
>>> +                     fw_name, cont ? cont->size : 0);
>>>
>>>       aw88166->aw_cfg = devm_kzalloc(aw88166->aw_pa->dev,
>>>                       struct_size(aw88166->aw_cfg, data, cont->size), GFP_KERNEL);
>>> @@ -1599,7 +1603,7 @@ static int aw88166_request_firmware_file(struct aw88166 *aw88166)
>>>
>>>       ret = aw88395_dev_load_acf_check(aw88166->aw_pa, aw88166->aw_cfg);
>>>       if (ret) {
>>> -             dev_err(aw88166->aw_pa->dev, "load [%s] failed!\n", AW88166_ACF_FILE);
>>> +             dev_err(aw88166->aw_pa->dev, "load [%s] failed!\n", fw_name);
>>>               return ret;
>>>       }
>>>
>>> @@ -1802,9 +1806,16 @@ static const struct i2c_device_id aw88166_i2c_id[] = {
>>>  };
>>>  MODULE_DEVICE_TABLE(i2c, aw88166_i2c_id);
>>>
>>> +static const struct of_device_id aw88166_of_match[] = {
>>> +     { .compatible = "awinic,aw88166" },
>>> +     { /* sentinel */ }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, aw88166_of_match);
>>
>> This looks like an unrelated change.
> 
> Without this, I don't think the driver will read from the dt node at

Then how would it probe? If it probes based on DT node, then it matches
the node as well.

> all. Since this change requires doing so, I figured it was related
> enough. But I can split that if desired.



Best regards,
Krzysztof
