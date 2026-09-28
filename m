Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63094F5DFA
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 20:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790628221; cv=none; b=nwwjjD1V00Yey4o5x9SQfdzzaRXaoGOiLVwSR+L2b1ciLsNhMcmzdHK6ouEOEOhO8BLuLjF9DqU6nwjiPAQP/Hcex+QebKm+gihIXA/Qg2yBQglLPFWbqa61Tq5UIXm3ynR7Vy2h2hilhoLH55vM+JLv7ybGXMM+bt4+HoM2B74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790628221; c=relaxed/simple;
	bh=1/Ac+f59UPuPR6jfHVkRyH2qaLha3pr4D2cjE98bNKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQCq1MPwInVfhpRyzu+9s8r4v55SaX5s6AOZlK7bGsAi9dcbzjUSCyDtYM/2ganIejsta9TH1JCvcB/FxL5sMdXWUfeXC/fvvCEkxOhVSRV/2Gb4BJfODj75ZXsxROBmA1cHWDSkxysW7RCIr6s6Y5wH0QTiXlbitiMgLEqSFek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nTRwgK1i; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="nTRwgK1i"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso18433685e9.3
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 13:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790628218; x=1791233018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iorVWdLlkotZMnSUwkOUwyxeHbcaMqA89GUu9SWioCM=;
        b=nTRwgK1iZGvYoBBX5jcAlW5FGsMFMKfe9D2dj0ue1zhh0gtng3VOLvZmCoT4zEIC1v
         srgXVwFYE+CpCadqxsyAbS48ltJexA8yFKLIYjo1yZRbIMk7+DxnJwNFQM1qN/2HWYgy
         hC54Jy9ORZGIohaaehxaI1JQHJcHJPXXf5+WYN3KRYevDVMkyUoBlSNeUzP61O/2ytHz
         KBxHXYX29xdexsy9W11lFHvKom2B4jgpsmRNZZQUy+zl/2pUbI4hO5JYb8fqiaOYzzfA
         RCuMAcdAaKDFcj9lTPjAXt7GfcrLinJ9P47M1K5zRpqwrnnlEqYjttaXJHXSMQxvQ2gc
         rFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790628218; x=1791233018;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iorVWdLlkotZMnSUwkOUwyxeHbcaMqA89GUu9SWioCM=;
        b=zGsQIIvHDGASShYwovXu6LrteExPmmeFcEoJoORcfwvuOaNqDNpf7qLD3xAji2dDLB
         LePlQ0IKIVwdjuYhDo6RRHjU3kz3W787CP8NJbWslLVSF88DoZBk2uOQCifHXoyw72yX
         cHfo9sgIIKa+w0XzwI5PxLHbBZUkRcJcaQgfswrgFjKW8mDmbJwvG9BX984IHzG4YpGM
         hK5sVhtBIsDX8q/lsTyjILpincHpXGJr3vEDw0l0kwjUvMGZMU/9qf3TbWXVgTkf7RH/
         bMOWlW7kgyINjxOJ0AvEsSRqezTQYqBn4AC4EYNlphBNhlNpcrOKRWoVmzEgcI8dG5Cn
         xNNg==
X-Forwarded-Encrypted: i=1; AKwUvBy9WaS8KrKz+4HVNxI8IhpBdKXflGCHXXVhnjI+SVDKF9XxudLGjijSHn3uyJSGJr0jwCuHLUQD42Q6IQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lyb2ksR0ZLz55s0NUSM3yHafzHsuOFyr/xeuDmRNqcvYdgqxZV
	YqSNp8Rz0i5+Vm3FoFiRhNmWalsdbi3D1XW2V/jXMDuYRLKjxTkhGpw45WeVkGLnto8=
X-Gm-Gg: AYBFou0dqxGOn6s2KCtEX/d8kxDyvFfUGQ9lZeGEfbBEhJEDD/pv4G5ULgmnHJMXJsa
	M2cP5eTgueksuBVYUNM7y/az1hTW9ttHuaYdaL9HTw330OZOInsnW29VWrFdk4xo/U1aEX3LOt2
	JjYbIRcKwFgs1N9cnmN756xOhTD3NjVkWsk0JE+wnTTud9jo7C3zm/zv07npSf6MkNNRQNpnOPK
	udxowIKbqwMRymnJLGOk62LANSgPCqKXc1O1voGgGD4l3zceLrQp6xKBc+YZ8pu3JZVTsYxDIhO
	gpGRnHnhNP1GuQSnnX8zDL4iQG4gV0Jr+WMXFtLwath7tolFA5h56sMmsw46KlodQZklixF3BT0
	Apqj3PAWgbrDAUQtC+YiEKUlWwi6OpCIOI+D9K3xK8GR8EDfLTdSbztahSi1hUzAu71zWL+QYeM
	cQ5p2Epp+DpbNWT8j8XyXsof63JBLMMwebfZlAK/QC85ZDcZ0Vlml7D1XSQ7GQrsoN44FAjw==
X-Received: by 2002:a05:600c:4e0d:b0:49f:ff7c:c96a with SMTP id 5b1f17b1804b1-49fff7ccb16mr127831615e9.4.1790628218211;
        Mon, 28 Sep 2026 13:43:38 -0700 (PDT)
Received: from [192.168.3.100] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf2d973sm23971435e9.0.2026.09.28.13.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 13:43:37 -0700 (PDT)
Message-ID: <8cead6cf-6981-4d11-b9f1-a752ae6b82c2@baylibre.com>
Date: Mon, 28 Sep 2026 22:43:37 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] ASoC: dt-bindings: amlogic,gx-audin: add schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
 <20260922-audin-v3-1-a760312c076c@baylibre.com>
 <20260928-native-hornet-of-luxury-81edcc@quoll>
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20260928-native-hornet-of-luxury-81edcc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/28/26 11:54 AM, Krzysztof Kozlowski wrote:
> On Tue, Sep 22, 2026 at 06:00:46PM +0200, Valerio Setti wrote:
>> AUDIN provides I2S audio input support to the Meson GX platforms
>> (GXBB/GXL).
>>
>> Note: GXBB and GXL are not known to differ so the driver binds on the
>> 'amlogic,gx-audin' fallback.
> 
> What the driver does is usually less relevant. Here, completely
> irrelevant. Explain the compatibility between hardware.
> 
> OTOH, you cannot have family compatibles (clearly documented and
> explained on every beginners talk), so what is the GX?
> 
> And I already asked for this:
> https://lore.kernel.org/all/20260913-inventive-millipede-of-certainty-dd58ce@quoll/

GX is not an SoC. It's just the common part ('meson-gx.dtsi') between 
GXBB and GXL, which are the real SoCs.

I think the confusion on my end arose from following the AIU design, 
which I now suspect not being up to date with newest design guides.
I will rework the series using 'amlogic,gxbb-audin' as the fallback 
compatible and only extend it with 'amlogic,gxl-audin' for GXL.
Please apologize for the mistake.

-- 
Valerio

