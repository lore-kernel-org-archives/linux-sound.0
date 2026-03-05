Received: from mail-m15578.qiye.163.com (mail-m15578.qiye.163.com [101.71.155.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD70621B1BF;
	Thu,  5 Mar 2026 10:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772708239; cv=none; b=oY8MS5CYB4lxMFshd31ArVHXUBjW1IKUwbqajA8p3kWzdV4vpTMcNlpMLQHeLivi2/j0d/R+lTpIoZVbrxaEzY6HtIQt+j07FseQa8TDS4sY90+zGGqc+rnmEQfyye8e5j8Rvgj7XrO6X6lTKT5ydHdnasRrX/st/8FZmwihTYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772708239; c=relaxed/simple;
	bh=ydZzjkd3srY41pDjjauT8Po/r84+3B+ezhhvPSYyXME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bn+GjqMbx+GxpIl1QunXWUs36iTu4JBuQAFQSTfgXxQmtyxTZMEgd3gR6G92kwfo1A97Iqp1EOJVOb7JsKOE5ijHNgbiY7ON9vzt3yLJE8W5Pe0Ru3RDBlobCt/Lg1dIsJmDp/LN+f8b3iHFyKtHBiNDzNTjKAcSNREVGS1Yjyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=bWSM/zls; arc=none smtp.client-ip=101.71.155.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="bWSM/zls"
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.lan (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 35e01d3a4;
	Thu, 5 Mar 2026 18:52:01 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	drake@endlessm.com,
	hongyang.zhao@thundersoft.com,
	katsuhiro@katsuster.net,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	matteomartelli3@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	rosh@debian.org,
	srini@kernel.org,
	tiwai@suse.com,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcs6490-rubikpi3: Add audio support
Date: Thu,  5 Mar 2026 18:51:52 +0800
Message-ID: <20260305105153.640356-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <b63a9bde-c2e7-4718-878b-e4161eecdc0c@oss.qualcomm.com>
References: <b63a9bde-c2e7-4718-878b-e4161eecdc0c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cbda03dff09d5kunm80b40df2cbccd8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTkgaVkpDGRlNQkJDThpITFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=bWSM/zlshVT82EN3dwqp2BadyVXkijiSLKAe/Ov900K8hoW3Xhui64yB2qsPjpBIHM/O2of4vQ7ePZhTCdLIUoc6LISFWzLFiC+joD77DKoIlXWon7QRIAQoRDqKjVLXR2/AH/FfZ78wO3CGvOCapnJg1L7vma1AYEJUrRV/GsI=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=Uepjv9AD2iGQI07qFYEAOP4DkAua1EFLAtIVvsFIl0g=;
	h=date:mime-version:subject:message-id:from;

Hi Konrad,

Thank you for your review.

> On 3/5/26 6:47 AM, Hongyang Zhao wrote:
> > Add audio support for the Thundercomm RubikPi3 board:
> > - Enable AudioReach via qcs6490-audioreach.dtsi
> > - Add ES8316 codec on I2C0 with MCLK from LPASS PRM and jack detection
> > - Add fixed 3.3V regulator for ES8316 power supply
> > - Add MI2S playback/capture dai-links for ES8316
> > - Add HDMI audio via LT9611 bridge on quaternary MI2S
> > - Add SPDIF TX/RX on tertiary MI2S exposed at the board 40‑pin header
> > - Add LPASS pin configurations for quaternary MI2S and LPI I2S1
> > 
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > ---
> 
> [...]
> 
> > +	spdif_tx: spdif-tx {
> > +		compatible = "linux,spdif-dit";
> > +		#sound-dai-cells = <0>;
> > +	};
> > +
> > +	spdif_rx: spdif-rx {
> 
> 'r' < 't', please swap them

I will swap them:
	spdif_rx: spdif-rx { ... };
	spdif_tx: spdif-tx { ... };

> 
> [...]
> 
> > +	mi2s-playback-dai-link {
> > +		link-name = "MI2S-LPAIF-RX-PRIMARY";
> > +		cpu {
> > +			sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
> > +		};
> > +		codec {
> > +			sound-dai = <&es8316>;
> > +		};
> 
> 'co'dec < 'cp'u, please reshuffle
> 
> and leave a \n between the property (link-name) and the following subnode
> as well as between the individual subnodes (but not after the last one)

I will change this series to:
	mi2s-playback-dai-link {
		link-name = "MI2S-LPAIF-RX-PRIMARY";

		codec {
			sound-dai = <&es8316>;
		};

		cpu {
			sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
		};

		platform {
			sound-dai = <&q6apm>;
		};
	};

> 
> [...]
> 
> > +&lpass_tlmm {
> > +	lpass_qua_mi2s_sclk: qua-mi2s-sclk-state {
> > +		pins = "gpio0";
> > +		function = "qua_mi2s_sclk";
> > +		drive-strength = <8>;
> > +		bias-disable;
> > +		output-high;
> > +	};
> > +
> > +	lpass_qua_mi2s_ws: qua-mi2s-ws-state {
> > +		pins = "gpio1";
> > +		function = "qua_mi2s_ws";
> > +		drive-strength = <8>;
> > +		output-high;
> > +	};
> > +
> > +	lpass_qua_mi2s_data0: qua-mi2s-data0-state {
> > +		pins = "gpio2";
> > +		function = "qua_mi2s_data";
> > +		drive-strength = <8>;
> > +		bias-disable;
> > +	};
> > +
> > +	lpass_qua_mi2s_data1: qua-mi2s-data1-state {
> > +		pins = "gpio3";
> > +		function = "qua_mi2s_data";
> > +		drive-strength = <8>;
> > +		bias-disable;
> > +	};
> 
> Because they have identical properties, you can squash GPIOs 2-4 into
> 'lpass_qua_mi2s_data' with:
> 
> gpios = "gpio2", "gpio3", "gpio4";
> 
> Konrad

I will revise it to:
	lpass_qua_mi2s_data: qua-mi2s-data-state {
		pins = "gpio2", "gpio3", "gpio4";
		function = "qua_mi2s_data";
		drive-strength = <8>;
		bias-disable;
	};

Thanks,
Hongyang
