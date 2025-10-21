Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0CC332ED9
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 12:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051375; cv=none; b=Byd0yTmtt+5n0jBrdju84tdUsplDDDabfWdKHwW/ErYOXegk/XusBI+rKgHt7+s71ulz3bIgSs4Sny4lz/U9aUSxWwrmj1FlZK7G4FBW19U7aID+jNxrr++36x8PMGvi8aT0uo3u7c2RWWvC8X1IP4RjTd0FgHWhW0mfp5aogrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051375; c=relaxed/simple;
	bh=G6BUtnjEM/zfg1qCW1pFmzrsk68q9uL7cRAs98tzYYA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=bexpVNAqurU2QUz3EM+E9tw67IHZU/aNSoq8yUeapKeLP/dMsnFRokSNQU9no51UKEsA4tiVWOKB7kLaZxsw3mfiJe4tPOaGkkOvVbA/WlchINzrirfoeoaaHBhtgaSRNAYsdVNI9XwwvJ5tL0ApfkC+4IYScNeVWXpDRJnT1xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=APVA8szD; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="APVA8szD"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3f0ae439bc3so2938345f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 05:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761051372; x=1761656172; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3+jqWip4cBpergxUpE3r3nDPRXBu9AkUkhJj9MutYo=;
        b=APVA8szDJAiTkZJNaj6Hq1AuBwpvzZ6SSMFTJ1vHdGh14L5DKXxBvCWI8ApIJGsVdQ
         JROzQdlXEuQnTZRpYCtwqhSdJIJAt4m2ZyHwkqMUQNQ8CzHZXSbiQc+WUtdBVCA0dXIr
         ZINJbqJOSId0NLQfEBJw3tOgCOKWv/CJUDg1MOXLbixyfMFezCKtU0BSfHwzCJNvAKJD
         eR/RgeIuMFvUU6iD7C0UvfabIidwx+uu8zAFd91jx7QTXORa4UF6BTQqukOc0OKC2DjV
         pbkkAhCrgYOrW/YVZnPurAuQi4PtAMMRfFAUgKtXVyjIPNzsmTegpdcdRE9QThVoJILN
         1Mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051372; x=1761656172;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D3+jqWip4cBpergxUpE3r3nDPRXBu9AkUkhJj9MutYo=;
        b=b96esC+MbFi9NxqCnksGaBHwmWW3pVwnNiUL3+Tjhlv7WRbvrS5CG92IuJCRglydpZ
         BKJHa3US/a/OoTZg/H8yTIUUgue70vO0uy+X2SOurR65mZYbnQaPT0h/t7Ebe4s67urc
         v0ho9bI76k6YFZFjmyMD27z3qbzooJL5dZJuULh6crSoFDEjnPYHEj5ntNA3qMTRsWVJ
         byJliNKRvd6vN/sQJM74WAL0oXsf9Ky9a5C1p6XLyiyaXPYKJsPJzaYmr9sbe/0oy6Wi
         8NYpxqLin7DLeC8HVltVhltSzL7PImMM8EXupZ5YF4RjxCdDfyKqpiKwd+18dwt5hrfm
         0S0g==
X-Forwarded-Encrypted: i=1; AJvYcCVZx0DG3aFBJGwNIMfNuGqPYapDmv2XKHACxkq66CMTCkOg1Azd3qTkcYxWsvQckCTg0ebWta5C0a/8MA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5hPq8PESNAJWzTutE9iLt0UX2WLFDzhH5IfUKL/ewx+d3MoWN
	BEiNwDTsO4y8kYhZEPOK7QCEsDpzDrufy5H/sQdoOT7rkDIxAANe/2X2MGl6MI8HFJM=
X-Gm-Gg: ASbGncsqs70/wkCh0JPJyBNrniWNKU4rWVPGX5FjwGtpTgQ4GMHJOsWb/W65gzNaGM4
	zzyQs8aKdPz1+0PEp0QXJarzC0BP6yK6qpP1q8PkuHd1FLvGJQYk85BU57k1G4rIeA4FH3YOJE1
	eb4Uq54WdWTU7kkbiRrVQ6kltJxwMb8puKVdosqh4dfMfGaE0g8DsCKhTMgLLino0xitp6mFayi
	Z03qHkBAPj3D2NrfCglwTZ3qRkb32SEAsjbS+6d+kbMInSmRgu9rHHT1zThAypAm04wpCfPPg80
	iMijcqSyM+QjqPVy1mUxsDISFYwEMuo94hmoEAeZ3KqIXvUeg7L4D3CZHWjzuRJW93swQnJK/R+
	Knlr77GFBo5f84/cFszs0hpKd6x53p3ZqpE+fKISgCoTzz4FgUfal35MFt+DlLNyZNKe2z4i+Ae
	6rsGul
X-Google-Smtp-Source: AGHT+IGwoXv9N8+tNudgKcCBOtAB/G2QWEcSJ7tMnIbD245sZlfvNJ9I1xX/MPofutEogENazBSdSg==
X-Received: by 2002:a05:6000:1a85:b0:427:f012:5943 with SMTP id ffacd0b85a97d-427f01259e0mr7681625f8f.17.1761051371929;
        Tue, 21 Oct 2025 05:56:11 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:8d4e:2f09:764b:8b5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b9fdfsm20142679f8f.40.2025.10.21.05.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:56:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2025 13:56:09 +0100
Message-Id: <DDO0LYS7UTEW.3A9WGTAA5DKVO@linaro.org>
To: "Bjorn Andersson" <andersson@kernel.org>
Cc: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
 <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
 <b6223af9-2d9e-4ccd-b297-79f63167242b@oss.qualcomm.com>
 <DDEN5NSLDIHD.C1IELQW0VOG3@linaro.org>
 <zmi5grjg2znxddqzfsdsr35ad5olj3xgwwt6hvkiaynxzm5z33@gsgrdguj563n>
In-Reply-To: <zmi5grjg2znxddqzfsdsr35ad5olj3xgwwt6hvkiaynxzm5z33@gsgrdguj563n>

On Fri Oct 17, 2025 at 11:42 PM BST, Bjorn Andersson wrote:
> On Fri, Oct 10, 2025 at 01:29:38PM +0100, Alexey Klimov wrote:
>> On Tue Oct 7, 2025 at 1:39 PM BST, Konrad Dybcio wrote:
>> > On 10/7/25 4:03 AM, Alexey Klimov wrote:
>> >> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
>> >> controller device node required for audio subsystem on Qualcomm
>> >> QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.
>> >>=20
>> >> While at this, also add description of lpi_i2s2 pins (active state)
>> >> required for audio playback via HDMI/I2S.
>> >>=20
>> >> Cc: Srinivas Kandagatla <srini@kernel.org>
>> >> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> >> ---
>> >
>> > [...]
>> >
>> >> +			lpi_i2s2_active: lpi-i2s2-active-state {
>> >> +				data-pins {
>> >> +					pins =3D "gpio12";
>> >> +					function =3D "i2s2_data";
>> >> +					bias-disable;
>> >> +					drive-strength =3D <8>;
>> >> +					output-high;
>> >
>> > I.. doubt output-high is what you want?
>>=20
>> Why? Or is it because of some in-kernel gpiod?
>>=20
>
> What does "output-high" mean for a non-gpio function?

This is not efficient. It will be more useful to go straight to
the point.

This description of pins was taken from Qualcomm downstream code
and the similar patch was applied (see provided URL in the prev email).

The same problem here and no response:
https://lore.kernel.org/linux-arm-msm/d8e202fb-f494-4b5e-bfb9-c94c1fd3af4d@=
linaro.org/

After looking at
https://lore.kernel.org/linux-arm-msm/39ebaf4e-e91f-4568-8de6-9fc1f805a1e4@=
oss.qualcomm.com/
I guess the output-high should removed at all (if it is the case) but it
will be more efficient to provide that as a feedback rather than vague
responses.

Back to your question -- does it matter here if it is gpio or non-gpio
function?

Best regards,
Alexey.

