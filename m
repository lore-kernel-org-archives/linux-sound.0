Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F462EF664
	for <linux-sound@vger.kernel.org>; Fri, 10 Oct 2025 12:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760099383; cv=none; b=IqMp1wP7o9Rs1FCIHtQlTbZ9qG+ZWDMxmlp7Sr3dgmmFHZtYammZtcKzAqEStwXvOrN2CFlgquQypTUn1SrIWaC6QXgLBkhW6p1ZFwS0P8F/tk1mPb6bYLjo1Esm2ruG4c/y25HM3F0zSwaRUfY4Tu1uhM50jXC7hvyljPCSZ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760099383; c=relaxed/simple;
	bh=m1wtM/Q36F3ke3zT/mN2EGUWRd5HFQIpRI6HpOMa2zE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=rwjGuR5E/BcudpXDDZJwwHP3UzPYTuoyYissec4HMG+fU9I0Xh002IC0FbJLDZ8GVRecff9fxdWOCQBofprqXpM99BuKWcV11Pxtme5AiW8J2tM93srqJa/I1F53qP0fqeRAkpxe0ZbjMXUE++f4134P4ibKEY7LGeqUuxfPxck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DRZMrdRV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DRZMrdRV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e2826d5c6so13188835e9.1
        for <linux-sound@vger.kernel.org>; Fri, 10 Oct 2025 05:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760099379; x=1760704179; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYMGQwZbrkqXXfmRn4FZdpSz5oqSucZM1pi40huO1ec=;
        b=DRZMrdRV+Z7AOt2j3NT/pgUP4UzEXdxIMgHs7HJiAigBN8Yr//Fyi5ghKZLVI0KMr3
         vhCnf9VSuH+vryIkrv2rC77HULFvgki0QuED2mD4cExxEc4h6sOCOlofOLHEWg46sCRp
         TGl5nPoI67IHz+TmR/v4ARQo5MlUbtD+aWLjOHCWE9BfM5aht7ia+Cg9j819ea6TVC1o
         czF5uB7FK2+9iFgyoVe+MsvdILYnaANCXdbrKZXzaAgXtUAO9QWymKObPF1Mk/xLsMRB
         wI9JFgvUOf5z3i0PDsOlgmoyFA+o00csP/DY6IYojpg99CeZ0QjSoJtdDu3+vZ5UT+GK
         Rwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760099379; x=1760704179;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vYMGQwZbrkqXXfmRn4FZdpSz5oqSucZM1pi40huO1ec=;
        b=bIURMro/Cw+zEv1JJhAH5PK6wq9gLqpcbWwlDb2qbPtDXsJMOKUCQwEeHRt8tlbD2U
         qN0hAJi8DE9QI2cfLXgY3mAR0aTbW49XEqf+HR/BVoVRtWjXOCl7g4Hz1z7Hkb2eg7H4
         PzHodAag5VtjEpd66B5kjZyCRvaL4j0MqqemfaxXTVWarH9urySAGG6zzMz8kYS8hAR7
         VGTNNnsHWfcm+2xjjuZTbuc91Kk92v+01tmuct5AAOQhMpZYii8pV5r00WdSMFydkjb4
         OBfx1mCdG3eEHQtcg1OVUs/pVZopm4ziy0ZqKU/cSApf4UOY+9zdWYZkeVsFS+I573RM
         Vn0g==
X-Forwarded-Encrypted: i=1; AJvYcCVTUTgJ6AhWbiirNzQ6cEhdDKY7I7OcxL0ulXD11/f5mvdCbNjknFodxLSLnPiDr9j1u25MJL+kiAcmLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOYfVdjacEtTiHSrAfeKlTk7iiKnvjV0wDHKxrfSslnYFrBLQA
	SPZSJWlMv/gD5MLWRIzM2W4593mZXd8hpdVGjo+/bDpNVtH3sOVPwJe5pYUzWRF1iD8=
X-Gm-Gg: ASbGnct/3u+v01uj1gHNM84krP+ilN69dneMMan+Ifr47V1gqoI8E/49qDxmP/WAppK
	0iFx+BBNMB9UnJ22VULsSmvA3yv7eA4/US1MUrdx/kX7MDURIgfgQ46gYdEBvjQCXGsdV5e8LFk
	kVOeV2XuHFxNGeQjgA4j7TuOKfFG2BvMgIKZ4jDL2/8AbVO17wQBnOcZvhMEbofA+yAhlnF1Npa
	B7nUV8que/EU7M5Q+COrNj3evZckXjzD1E0uzc/J61VGxaE9+0K6VN+HkMsZqGE2l4s02bvkLPA
	wTdRvkgKIUK/L7CNCg9TYmP56c86Ndagaht7Sn5F4tc0oyp2Plh7ZIX1Z0quxQLmMixdmkzYo++
	Y/4M3jfYy715bKXqfKULxqx1wEyQVaaTPOeH428Y1K3TyEfTJ/bZ+IipOg10mvvOrywSHeqQ=
X-Google-Smtp-Source: AGHT+IGoFKx9FL3rwMgBVIjzsX+nvkrUpEkSRitHHR0xBr1fRpbwIRCWVFTLZ13CTdC6I1m0m5CVFw==
X-Received: by 2002:a05:600c:34c2:b0:46e:21c8:ad37 with SMTP id 5b1f17b1804b1-46fa9b06d3dmr72900375e9.25.1760099379460;
        Fri, 10 Oct 2025 05:29:39 -0700 (PDT)
Received: from localhost (054722ac.skybroadband.com. [5.71.34.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3e3520sm62462795e9.2.2025.10.10.05.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 05:29:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Oct 2025 13:29:38 +0100
Message-Id: <DDEN5NSLDIHD.C1IELQW0VOG3@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Linus Walleij" <linus.walleij@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
X-Mailer: aerc 0.20.1
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
 <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
 <b6223af9-2d9e-4ccd-b297-79f63167242b@oss.qualcomm.com>
In-Reply-To: <b6223af9-2d9e-4ccd-b297-79f63167242b@oss.qualcomm.com>

On Tue Oct 7, 2025 at 1:39 PM BST, Konrad Dybcio wrote:
> On 10/7/25 4:03 AM, Alexey Klimov wrote:
>> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
>> controller device node required for audio subsystem on Qualcomm
>> QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.
>>=20
>> While at this, also add description of lpi_i2s2 pins (active state)
>> required for audio playback via HDMI/I2S.
>>=20
>> Cc: Srinivas Kandagatla <srini@kernel.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>
> [...]
>
>> +			lpi_i2s2_active: lpi-i2s2-active-state {
>> +				data-pins {
>> +					pins =3D "gpio12";
>> +					function =3D "i2s2_data";
>> +					bias-disable;
>> +					drive-strength =3D <8>;
>> +					output-high;
>
> I.. doubt output-high is what you want?

Why? Or is it because of some in-kernel gpiod?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arc=
h/arm64/boot/dts/qcom/sm4250.dtsi#n66

>> +				};
>> +
>> +				sck-pins {
>> +					pins =3D "gpio10";
>> +					function =3D "i2s2_clk";
>> +					bias-disable;
>> +					drive-strength =3D <8>;
>> +					output-high;
>> +				};
>> +
>> +				ws-pins {
>> +					pins =3D "gpio11";
>
> Please re-sort pin entries by the gpio index
>
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-o=
f-nodes

Ok.

Thanks,
Alexey.

