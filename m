Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28BC282F36
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 03:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783049317; cv=none; b=mxofAxyf+MsyrdgYI9hvpz+AXXsUgURAReipxWaVRZgbta+LMgOfudLTQt3msExCr5MbiubsP1lsVxvcJUDWR4KuG3SfevVd4DTnefLwV1GG0BsLgOe3QR+0lX9csMc+eMNtjNqzwHl04Pmz1QiEPQCWb+hURkaWQ6r/ZO+YmXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783049317; c=relaxed/simple;
	bh=KETg63QyAVz8Iy3WXA/+HPsMDUaWHNzyo7wwIqK34zg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ATO2tLgOh9vf5DX6cr8gRu1INSvPy1XCAdfbczWdYMnCEbPAFlVU/wnXKf5AJxeIuOTppHTZaXbxrL71KdkrJaL/qLFdKOyZtPMZRyBmHFQ6cNZOip8Ci9BGjrSJpeI5H9hmh8PNXivF6/ahbe03mii9KGUbILWdUIf4iHFj968=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOkfPJyP; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOkfPJyP"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9a20f70263so80939a12.1
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 20:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783049307; x=1783654107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9af5QJrOyBu/hey/MipR49TzaYy5BSj5PKVbFBhQuCc=;
        b=eOkfPJyPdnFcFXt7dKGKly9fVWx9U9VUynCiTdrRVjhTAKkBUxbMxaLKk++Olhvl1b
         RKpBLBGsOWAEC5ZFeYkK4T6IeMLe4axr0qebGcLP7hvjSGy+OYp54lqyb9aExmi0Pp0h
         DSZYtCXyT49ZkVevLu4p+HuL0RWk0YvH7wYZ/nH+V7/oIW32uizqBVbDNbnSy7WL+EwS
         S4rkV74Isk0JSShKX1K00d1EL/ni1Pz6K4sHNJ7cMI1rroOwvtfMEpZV17npeLlKki9f
         q4mLoNVR3cooSpNr2JX59wm0dca4YQJuhGlBhP4AJ/ydMsi8oLpJ1Wg4KqpkP5RqJ6xk
         3Z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783049307; x=1783654107;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9af5QJrOyBu/hey/MipR49TzaYy5BSj5PKVbFBhQuCc=;
        b=db4+PLu+d3yKECL9OqxBsVyA8NeRPCEFzexbi9y8cRAc4KorvJHcR+IgcLnFbevxFK
         p/ZbtpRmsk0KCp/NBVNr+i8+qYKOavoWplDPLJvnv7UNKkMvywIxNto7/ObS9ATI6xGS
         N4R2bAnkKWpwtyHa6RS6xYhiaIWgY41qi4mq6ptwVvPXrApE34k8KRkQfHU2v9K7fSXC
         4GupULdFVKDj9dQpNVmEMD9nPiJxvU3+cel6vyyz2ekmb70A/0vx2K31g07Fl9UGg1iv
         oIGE8/4Ojh86VljobReN4vpvsHouu94Q3HFQB2eAaUsKvaJvzRjwROLVK4gsiWg8ba76
         f4kQ==
X-Forwarded-Encrypted: i=1; AFNElJ/p/j9YHT++xfPVvqHK2yydPHf+C8g9U4KC/E04fQgPXz2iFt/oZQF6RbEnV4qiUeT5PXxKDTKkIBQ07A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7k7hBqBNPqEWRjzdssMLd3Na1zPCJ3oxn0B5IfPkq1Uk6pbqA
	684QvRbZA9obDsZcEi4kUstjLaED3RrpStEwXdblPzGS52vA3F1Tcmlj
X-Gm-Gg: AfdE7cl1VicyPuLW3kmqnkPiXd54pJNQlxiyVuDKro3Ta9xb4mHrXZbrmtCSdFJqv32
	mfKadJ3m4lZTdbUhU1BCOhqg5YFSsdr2ytabT/DogsPrRZ7Pb5n6vkxY1NhD8qYoo+twgqLaPKV
	62SpeVMYNnbMey+qMdqqLaXu5y1+A7oocjehPnNOmcZEtm0QOymaTqlGy5IRVWeugiSSnJykEAb
	22+5A5B384arvwmYDKH5ngLRRNUoxdeIrk0sGy+9c3CH6nXGTIVp5ukhd4KWP0AlWwGwtUNYPpl
	he6y+yJ7EkCbEYUE810l/o53+ZjoNyObDR3JMowo5ECoywxufASM99WgImOFoZGEBERnkRNLCbI
	VE+/ACUvPO0H/eaJhurNtScQE+BTmy+Xwj9Clliz7ilyZIGGTg3xWNtFy4bnbooApdKPD7PdLvN
	Kne3HAcTj0tsaT8Hph4/qmArjOQA00/3LCXux+KijyFxh63F1gOA==
X-Received: by 2002:a05:6a20:918b:b0:3bd:1cfc:1b9b with SMTP id adf61e73a8af0-3c01c65feb5mr2729058637.10.1783049306833;
        Thu, 02 Jul 2026 20:28:26 -0700 (PDT)
Received: from [172.20.10.3] (114-137-82-69.emome-ip.hinet.net. [114.137.82.69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e91b0762esm1988467a12.20.2026.07.02.20.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 20:28:26 -0700 (PDT)
Message-ID: <3b32493b-b827-e4ed-3ad1-281dc19faf40@gmail.com>
Date: Fri, 3 Jul 2026 11:26:12 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20260630021510.821919-1-YLCHANG2@nuvoton.com>
 <20260630021510.821919-3-YLCHANG2@nuvoton.com>
 <66ce56eb-95b9-4915-8658-a1e4d1eacd7f@sirena.org.uk>
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <66ce56eb-95b9-4915-8658-a1e4d1eacd7f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/2/26 23:15, Mark Brown wrote:
> On Tue, Jun 30, 2026 at 10:15:10AM +0800, Neo Chang wrote:
>> Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
>> stereo 30W+30W smart amplifier with an integrated low-latency
>> Advanced Audio DSP.
>> +static const char *const tdm_data_length[] = { "16", "32" };
>> +
>> +static const char *const tdm_pdm_length[] = { "16", "32" };
>> +
>> +static const char *const tdm_data_n_length[] = { "8", "16" };
> I would expect TDM to be configured by set_tdm_slot() from the machine
> driver, not from userspace.  I see the driver does actually have a
> set_tdm_slot() operation...

Hi Mark,

Thanks for the feedback. Regarding the TDM configuration:
Our DSP functions require specific Slot mapping (e.g., Slot 0 for AECL, 
Slot 1 for AECR).
The standard set_tdm_slot() only defines active slots but doesn't handle 
the functional mapping.
We originally intended to allow dynamic mapping via UCM/userspacea and 
then apply these settings using set_tdm_slot().
How should we implement this mapping according to ASoC standards?
Should we define the default mapping during the codec probe stage,
or is there a preferred way to handle this via the machine driver?

>
>> +static int nau8360_read_device_properties(struct nau8360 *nau8360)
>> +{
>> +	ret = device_property_string_array_count(dev, "firmware-name");
>> +	if (ret != NAU8360_DSP_FW_NUM) {
>> +		dev_err(dev, "Missing or invalid firmware-name property in DT\n");
>> +		return -EINVAL;
>> +	}
>> +static int nau8360_i2c_probe(struct i2c_client *i2c)
>> +{
>> +	ret = nau8360_read_device_properties(nau8360);
>> +	if (ret)
>> +		return ret;
> This will fail the probe if we fail to read firmware-name from the DT so
> the firmware name is a required property in DT (and ACPI systems will
> have fun) even though it is not marked as such.  Either the driver needs
> to tolerate not having the name configured one way or another or the
> property needs to be mandatory in the bindings.
Since the DSP firmware is mandatory for the NAU83G60 to function,
I have updated the YAML binding to make firmware-name a required property.
To ensure robustness, I have also added a fallback mechanism in the 
driver to use default firmware paths
if reading the firmware-name property fails, ensuring the driver probe 
does not fail.
