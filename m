Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C72030E0C3
	for <linux-sound@vger.kernel.org>; Mon, 13 Oct 2025 15:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370179; cv=none; b=lCoE9hShb30rnu5pC7q14dKTjTXsk7mOdehnZ9c6MhDxMDkSxN/ArGPpVcmM1ijETpuC2c2+IKCsMvMgcbGzluJS8G/e4qvLxxFiP8fZXiyHW2Gj+PC6Dli17qNgfVvnU3yu2oZIL/EQmR6kitzr8X8Kgo1x9z27CjEoGJtniCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370179; c=relaxed/simple;
	bh=zHUy7XXGMyXFLXpNE2q0vIraquILzGwKPNK5Is7w658=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=is4XNIkkqMMayELxsX+yMpGtBS5hIVf0gPEzYpFXG6ATjlKvPN9aNm7r6OEEW9KmRyeZgUdN+xvXWnmJ12SqpcRJhn2pBLO+vBzTwsk4pmj9M9/4HHu6uWKjftbwhCqzEkPFb0Xv2Zm6wQMPvGdQNEz3HiiJIY3bYUTVCq7HWbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FGvPhjr6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FGvPhjr6"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e37d10ed2so40357575e9.2
        for <linux-sound@vger.kernel.org>; Mon, 13 Oct 2025 08:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760370174; x=1760974974; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHEv1j+HHd283A1HRLwWHl44uhnMzzIL2eUu93Oc5+0=;
        b=FGvPhjr6UjrQemq9uVjTCWMt1jW95zRG6vTdHtVOLu3Qe8cIXWAvtLc1zMh9SWkzzc
         Q/+RYL01YTFTc1fsH2M05V8cak11kyK2QyZ+eVMIwBhof+iLVACweRvaX9gLXoGEW7nU
         uSmfO8lipm81YqHAoiCDpmUGaiLPs1kKrp9I0zRAXxm9NT63LZ4c/KxJWBw2oZGTBFxl
         aM0NDyQdWHhh5HdhryvGTdNxLm3tWhxP/AW6hMgmsmNA+ILQJCr3bgCK1LwcywmOFA9n
         0W7YWBA7yfNOBF8pDRI9Rc+2s7PQJjg9mboCaANZc3V4VxmBbHwtk6r6yqzzfvmZTEjo
         u7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370174; x=1760974974;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lHEv1j+HHd283A1HRLwWHl44uhnMzzIL2eUu93Oc5+0=;
        b=U9Ogdy6AMkvnJfK16sOMjNfw9lLf5B2SRTXdc86O0uyNXiHvWpAxB8BDTCUQLqKHuk
         LnZY6r6Kp+zhCoMD+Oloy8VaRFzwQelaUheKNI5LtfC6ERD8xywq5z1XnvCYxw/aPgw/
         Tk4mMzt9bDeRGE1K+FuwkYWIdOWNd6gBUsqcFP9BnemYLCTWDjVIhDdR9xjqyEZFaVJz
         C2Kj94R3O1e5cspKE/a9H4tEuZBpELvPiLXmEuaBFGkBZLN5jF9bq4rPCSYbSa2Z4LXw
         CpCYtNfAn7IE3OFA6jLW5FCGfokL5ubWgr/h1uWI9oO+MHLIG2VOFKfntL86WIIGFnK5
         a+Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXuwGMBp49Van+uzjTdDVPvc295SUO37jHMhcZes0uaEa0jIKXAf9CGPkuRHw3fwPLyG+itn2aYKN9jNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUpYy83DZK7ujOgIIlDAW4pkTh4uTLH6vZ2FWJhgn4gNqSw8cD
	8rTN2vOq6bwbKwgWhXYKhZOlmXEBGlCHgKfHBZjckEqClU7Qajro9ChajPG2O00atAY=
X-Gm-Gg: ASbGncuU/5wvxIL41C/ClBOEVQZ8ccpul07CXIOir++EKiqmQrbnzOEZssfLbd9PtSh
	vEnH4/N4e7dztn+5zuZXSbzPscMtb6lyNhXb6ODBJHNBsNPKe4NWjQzrvYgP9V96yHNisAyWoD6
	I7tjollZqm64oaHrCJx2BzW+Psfj9MhTC9g7K6ZKqbEi4xbchXxuf4eKlwtKZ/tcNjk7X9JQpng
	HkMPwh1w6gC6bzx+5QOWZV+s7kAMENa1P4qnZTIk86A6QcL8iQMNB7zFAYEXEDl6AWt9QzMuvEp
	oC9W7v6x02NM7V1rePUWdK3cejS6GSnPGCWHPw+L95riab9iNWqkvA7JSF5Dal7MvNwvoYJ2fmq
	3rO7kJAg1EvOJ/6DFoxeJfSyAvoCpYH4hRaKpFgq5tslzVtvnQw==
X-Google-Smtp-Source: AGHT+IENs+5e8LKBfLhRT9P70/UD8KqfOPC4WFoR5uKqHSevkq3rY6VCRH7NruUPqe4xFx0PkJgS6w==
X-Received: by 2002:a05:600c:548d:b0:46e:49fd:5e30 with SMTP id 5b1f17b1804b1-46fa9a8f4e3mr158026495e9.6.1760370173692;
        Mon, 13 Oct 2025 08:42:53 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:4e8d:2e2d:48a3:9e4a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb48a6069sm192562845e9.20.2025.10.13.08.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:42:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Oct 2025 16:42:52 +0100
Message-Id: <DDHB5915QELQ.38GN91PJ6ZO68@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <vkoul@kernel.org>
Cc: <conor+dt@kernel.org>, <srini@kernel.org>,
 <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v4 0/7] soundwire: qcom: add support for v3.1.0
X-Mailer: aerc 0.20.0
References: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>

On Fri Sep 12, 2025 at 9:32 AM BST, Srinivas Kandagatla wrote:
> This patch series adds support for Qualcomm Soundwire Controller
> version v3.1.0.
> As part for adding this support, a new macro of_property_read_u8_index()
> is added so that we can remove the qcom,din-ports and qcom,dout-ports.
> As v3.1.0 supports more than 17 soundwire ports. Also due to change in
> the register offsets, new entries are added to the variant data.
>
> Tested this patchset on T14s and Glymur reference platform.
> Alexey also tested this on SM8550
>
> Merge strategy:
>
> I think the patches can go via soundwire tree given that Rob has
> provided Reviewed-by on the of_property patch.
> Vinod are you okay with this?
>
> Changes since v3:
> 	- added bit more flexiblity to driver with a missmatch message
> 	to address incorrectly specified dt-entires.
>
> Thanks,
> Srini
>
> Srinivas Kandagatla (7):
>   of: base: Add of_property_read_u8_index
>   soundwire: qcom: remove unused rd_fifo_depth
>   dt-bindings: soundwire: qcom: deprecate qcom,din/out-ports
>   soundwire: qcom: deprecate qcom,din/out-ports
>   soundwire: qcom: prepare for v3.x
>   dt-bindings: soundwire: qcom: Document v3.1.0 version of IP block
>   soundwire: qcom: adding support for v3.1.0
>
>  .../bindings/soundwire/qcom,soundwire.yaml    |   8 +-
>  drivers/of/property.c                         |  33 +++
>  drivers/soundwire/qcom.c                      | 257 +++++++++++-------
>  include/linux/of.h                            |   9 +
>  4 files changed, 199 insertions(+), 108 deletions(-)

I just tested the whole series on sm8550 and it boots, playback works.
If it is needed to provided tested-by tag for each individual patch, please
let me know.

For the whole series:

Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # sm8550

Thanks,
Alexey
