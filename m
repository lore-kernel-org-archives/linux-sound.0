Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03031E5B7D
	for <linux-sound@vger.kernel.org>; Tue, 27 May 2025 14:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355452; cv=none; b=DOCj2zfqCnXXLP+q94zmHOBABLXQkZ36BdPg7Neb8lyMcYQs1eZ/kutZEjezMw5NBObXj4aY+CV4B/NXSr6HLBC8kkG68Uz1PBxllJCBBEsc3oEso7+1aI9VaUPqRBCiwjnYM0B4oeEg5DlMk5G0ah1mB3z0vvEErx2q30Iq6MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355452; c=relaxed/simple;
	bh=qzCxInDBL5zoEuqaKs+Cq/1I3KI9pngcneQ2CyA3Ujw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=S0NbBnYZ9+qJe80pBAphp/lLjk9/QL0m+yG2gFVGq5OFbO5eFMcNmG5npnC+pX/Abo3EbEwNBB9ZKTNUzxZeT7IEc/iBpd/5VELKtcHRdO5hPIw+aD89ndJ1NSF69JuUWHrMOlGt5I0qwNvGuP9Q5bitRfyNFnmgWe2C75ZpFEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PWoXrTj5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PWoXrTj5"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so44855725e9.3
        for <linux-sound@vger.kernel.org>; Tue, 27 May 2025 07:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748355449; x=1748960249; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzCxInDBL5zoEuqaKs+Cq/1I3KI9pngcneQ2CyA3Ujw=;
        b=PWoXrTj5c0wrG0Y6Jv8+00M6uhEEK7DhE36StAOFiZjUSCyW/eWIQn12d7nMnaZ138
         DiAd7KJDg49x7dkOkeK3TDjE5S4gGSLFpioteWAyQnw7gnsmHHPxo4WC4COBWM4mFQzc
         oX8nTtYncuXaiCNKex3BZGNMPbsIBp+jmAi8LbUkq8fZY3x1S+snE+zBQ246zwrrg1+l
         d7eOPRCNZNTfK+EiySop4Hb15WQriDh9wHVIKrqV7LzmYFKaTEAmkj23Pan4sDkQ6eDs
         YeRUFCn/B/n7Add3qeNupatooyaoDQd8mDu6AmkpQ06yqy+YgL9PNSzf+CuNMMC8tejx
         4Blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748355449; x=1748960249;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzCxInDBL5zoEuqaKs+Cq/1I3KI9pngcneQ2CyA3Ujw=;
        b=WUrqCbjvLHeAYluHOI20Id2MxWiTbg7wTGLERGPekdvaQ+PLeYghGuGCNI76V7SVFJ
         TAA9KheoCchr3/wuHIPjDxKYX6liBM3GAlqs93gOR8sIKhDhYEXYVjgj+l4DipJDfTGG
         JZsuF+ngZdUQbJzCHpgWDKsu/mYgOimk+uyPxABcDTFdme79pMv5xPDrI/6wkiGK8VLo
         1ioxjKbiBLhh99T1Tjpu16b5CqWZR38Br0Uck9Otpixo8WqNDaV12RhcnYHudnnuO9oA
         J8Jqm/v1LfMHaRUgU9YTyJu2RnIoxDWKYdcKksAfMKJrKjlBliuxhkLZUuO+EsSyGehg
         +U1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeXk4cT7oDmZIfVKqu6SeACZqNqS+FYOCfrkAsxlLeEZByunAHfMVr4JAl7hKDGe1GvVudeLRZbSXpaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ+twISr3SX6qO6Sdz/9BpePZVLaCwSrN0pKXfo31E79z5OqR0
	z1ZMjv95kHgk0OXcXdsEt4R4mQTR6XseDIZsor7oSPjzm9FHpd2iWMcqOPv8f0ovLXs=
X-Gm-Gg: ASbGncusp/AO0BXOb0nEAulRvNOfUCA72U75Rhx/nPFlRTAkKOeftrpBALChv1ZyYid
	lN9YeyPSnNWm/w0KhOvBG3I7YjEMnRkH3G2+EPVGC2o0v1plyBjNExHlQFRDSeD/PoWb3sO/Fhv
	8jI0eUenf8pdkJLBMYN4axwVf0Smqfg5Ngj0kV26v5hoOIIWZWCTAOb8qw+ErKH/NbMHuBQTUkt
	CITYbcoosXp1CHlrRf1HhS92hUNlZARa61J6x0UHcEUp0xgnIVpMMCGxmhZNFwF/iiwgsr0fp3c
	M6l/DyZAjmPg7HFWn6HPL9w44UazxuJtgN814N4UJbZUYchWAxLgPONM1g==
X-Google-Smtp-Source: AGHT+IEhc9SSryCY2JDYzu6BuvIZwbGB1eIwIJMculZ/SWsJAs6OkosbQI944ev/3eMu/PMW8z+Bgg==
X-Received: by 2002:a05:600c:5103:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-44c955da49fmr100008385e9.22.1748355448879;
        Tue, 27 May 2025 07:17:28 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:f024:90b8:5947:4156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd99absm266645615e9.37.2025.05.27.07.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 07:17:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 15:17:27 +0100
Message-Id: <DA70A4LOJ57L.1RTX2K0Z6PU0L@linaro.org>
To: "Prasad Kumpatla" <quic_pkumpatl@quicinc.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Linus Walleij" <linus.walleij@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
Cc: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <kernel@oss.qualcomm.com>, "Mohammad Rafi Shaik" <quic_mohs@quicinc.com>
Subject: Re: [PATCH v4 0/8] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp
 boards
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
In-Reply-To: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>

On Tue May 27, 2025 at 12:12 PM BST, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>
> Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp board=
s.
> The updates include adding the necessary audio device tree support and th=
e required
> dependencies.

Do you have topology file and mixers commands (or UCM profile) to test this=
?

I already asked but I don't see any replies. How this can be tested?

Thanks,
Alexey
