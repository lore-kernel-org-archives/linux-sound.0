Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B030C2EA
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 00:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757551964; cv=none; b=CihsnH5FagjeSw6qFn9Ib4owa26iIRQ8HmsKd09e6bAzXIqybT0imwtKndp0/KqevzWv7JljIkjoHzCRwcthQII4blrlQ6ccOnUsQEq4T/qcIZ7ezU7LoAJMvUjnu2zGB5pKJIgZ/GmUFFj7W1TdpqIRW97FUokH/ZP9xosQ2F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757551964; c=relaxed/simple;
	bh=n9ik6TUUZwljOCIrO/RYqlpUkEHDUTilfPvJTnkLFjo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lhPKEcRYFBdpndFzHEcDC/UOP5LyKLL1mm3jkhYFs3z7WpcSfnYAZoCFPP6hsemu3OXIk6r/IA3+lJpTr9M0oRJlAJ7cGViGVrXZY584Tjw2cmLboyBCaHnDYm+CoGswNGghhVNvsS0SrylBnM3C+96h2IZoowxMbn3rAfytQvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H9A7NTiI; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H9A7NTiI"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b9853e630so1493775e9.0
        for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 17:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757551961; x=1758156761; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9ik6TUUZwljOCIrO/RYqlpUkEHDUTilfPvJTnkLFjo=;
        b=H9A7NTiIgm533S2hmEWK2hrAh3F9/41xD2qzm7Co1pX6haLCk3gsBSDVF4SLTY1/rW
         GV4uyykbBUtEFcMUguIn0f8LhpnC4QIe6qWPK0CGNTQUwuomeTvC2ZcUIyacYcS/C2hU
         7xv/Kg1U9OXXryzVD4t2zn0o/RsbD01QngbGX6gzgnb9fzpRT0jX3n7Cg2vgSs3pq+hy
         krIuW8YHngBDjEYfFj62EbE6bRCjHBjv5DN5+gDAG2mfcM30AYqOblCn7dMmzJkQMgAg
         1Hxww28weKqWwyT4WLHz7WPuWi6nsSmoKiwf9TO2DPt5XmagJnN0dJLvRQrx2RDC0YB5
         +BjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757551961; x=1758156761;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n9ik6TUUZwljOCIrO/RYqlpUkEHDUTilfPvJTnkLFjo=;
        b=ACC2/WB2XI8NwE0mLtopvQTKT8qS4PvlCHf/tbOswomxaJ43OnkvnvKXtjcKrvP5Fz
         AP5HWEsGjlqd4a0cuuoYAryL4tAu4VK/98lfszkHLzM6KrrgOGIdnHaRjUEHiTBB04I2
         xcIyyP1XvNjAtT8Xd9xX9qeFfw+B2DJN2iz7aFitql0QHgERHqiXjxm1j6NtzyGSPIlV
         aIUCuTwNF8PoG8oWrwl/+7DQl4QuySQ0Hzgf6oIH1VuEGDxdkgr4Gg76TCud2EsQvkAv
         fzO72UgaTOBE5s4SZ0P9DuBJl7LeXBYesPmczBDgv8aDeW1EWoaa79UoEee+JVNtfb4u
         +szg==
X-Forwarded-Encrypted: i=1; AJvYcCVd1WSuXB4572yJpiZy9tjIO7xPXxuUbeEiPg3hVGYUrMR99X1SyzWvq+mI6pLH2Lb+pbgLI9hnoamfyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVEhT/JHpiqbZkrre1qdTpzPmIO//fGXV5icZcR+byKhmyRnt5
	dgHP3DCjbCjn1DzR3kZKAtVnwOjr91psmQOzOmn/J4nWqauP1U18CYPzayRZ6Ff1HMzuxp0b0MG
	En1i6
X-Gm-Gg: ASbGnct/o6UKz6sU5io53kZtuFZW+0ee6ISSOinSKqmI84Q6Qz0I2056cLpnL6sr7al
	Xh6SoIrv0s30W3e98uRh/PKXrV88C1OYZk5GOGKsgKdlWb9+9xQ2mlmJNSKmnOB8nq2x00pI+d1
	sbvHuiZLWJl7LaFoo1FrKI7cwTPH32+AQmiIr26yMGwGIJefgmRrjwNtAyf2x3RDkGbZleYIYDu
	OxpIffa/qmi/sTxNbbd6bzwsnTu/Q/HahR1P1alfDi6SGsAELRurAQLYlwqG8JZ+YVuMDQlNJOf
	WYRzMe1nW/UDd7X7U3yM14OXVjUy1tO+scDOIejvgbdaW5JsKwfjbIel9c6l00C49X7j0RDzgB1
	VqOQ0gSbw/N75kMdVn/4+zQiJ6Mi6yMB6jX0uSw==
X-Google-Smtp-Source: AGHT+IENdiQzRqD0ilOksClnHzZl9EP7+Iq2b/6pNdScPtqokFRIwU5MWit31uB/hgllOsIIQBjxTQ==
X-Received: by 2002:a05:600c:3b8e:b0:45b:8039:6196 with SMTP id 5b1f17b1804b1-45def8828d5mr85496425e9.4.1757551960624;
        Wed, 10 Sep 2025 17:52:40 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:a727:6a46:52e3:cac2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017bfd14sm6363865e9.21.2025.09.10.17.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 17:52:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 01:52:39 +0100
Message-Id: <DCPK67SQ5DEI.2AFDVRKZSEWTS@linaro.org>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <srini@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.dev>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v3 0/7] soundwire: qcom: add support for v3.1.0
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <vkoul@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>

On Thu Sep 4, 2025 at 11:56 AM BST, Srinivas Kandagatla wrote:
> This patch series adds support for Qualcomm Soundwire Controller
> version v3.1.0.
> As part for adding this support, a new macro of_property_read_u8_index()
> is added so that we can remove the qcom,din-ports and qcom,dout-ports.
> As v3.1.0 supports more than 17 soundwire ports. Also due to change in
> the register offsets, new entries are added to the variant data.
>
> Tested this patchset on X14s and Glymur reference platform.

Well, I don't have any Glymur devices and no idea what is
x14s (I guess some laptop), but I picked the series locally to test
on sm8550, it seems there are some generic changes, and
qcom-soundwire probe failed:

 remoteproc remoteproc1: powering up adsp
 remoteproc remoteproc1: Booting fw image qcom/sm8550/adsp.mbn, size 8364
 remoteproc remoteproc1: remote processor adsp is now up
 qcom,fastrpc 6800000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: no=
 reserved DMA memory for FASTRPC
 PDR: Indication received from msm/adsp/audio_pd, state: 0x1fffffff, trans-=
id: 1
 platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@3: Adding to iom=
mu group 12
 qcom,apr 6800000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev=
: gprsvc:service:2:1
 platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@4: Adding to iom=
mu group 13
 qcom,apr 6800000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev=
: gprsvc:service:2:2
 PDR: Indication received from msm/adsp/charger_pd, state: 0x1fffffff, tran=
s-id: 1
 platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@5: Adding to iom=
mu group 14
 platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@6: Adding to iom=
mu group 15
 platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@7: Adding to iom=
mu group 16
 qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode
 platform 6800000.remoteproc:glink-edge:gpr:service@1:dais: Adding to iommu=
 group 17
 va_macro 6d44000.codec: qcom,dmic-sample-rate dt entry missing
 qcom-soundwire 6d30000.soundwire: probe with driver qcom-soundwire failed =
with error -75
 sched: DL replenish lagged too much
 platform sound: deferred probe pending: snd-sc8280xp: WCD Playback: codec =
dai not found

Are there any dependencies I am missing?

When I reverted the series the audio started to work again.

Best regards,
Alexey
