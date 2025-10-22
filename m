Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AFB35B142
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 17:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761152703; cv=none; b=rckq7DakVhUSWWPuL2GeitoRzURjcWSJKHhEG8JCrga8+hxkC7hPvUCGb3Vdvn9oonzaGnhCAtdcXepge/icfYmEsiXGEJKD088XwsTee3u/bo/BlHIKorRs0wlnGoolFMIyz4+lDzLVoj9SKPXc2AVELcE4jKA6xO8YR3F0boo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761152703; c=relaxed/simple;
	bh=EgunH31eTnsVb/QLiEMMM1PyLJAVFDnbYWNUJS4Vl30=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=i4x0GOTG0wOSWKzPjbtYsLIQCmQzUmnhFv1AYiVo2X4RelCpkkZ+Xmr4/dljflRxaV+XJ4v098rwfXzVPAk/S93uvYREc38GMIqwV0D9ugwIgdGPV0dbdJQ/QlIvxLqL3NpEUCuEfkBhMHPcLEUoE/bUoF33DhGy6EOKox5T17U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KodlE0R1; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KodlE0R1"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47495477241so20462295e9.3
        for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 10:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761152699; x=1761757499; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32wWVCnxfPxXwYEHrPhplOIt/hFbj1bnM86HXOsRbI0=;
        b=KodlE0R1GQA9GEWGXTHyqDj9gLNV4yOVhDFiSFIqRGP61Ly1OBmp6THR4N9DTXfNZb
         0XIrPAaBaYGs1hIS/KF2RiAQ/Pzx/YW4n+bECj2aERB/icOn1HMHpY7mi6XybgwTS2Br
         qUQAgpK7KgkqKi1aojPfd9CuaS376aCNURdbmSU4ysueh37Axjn7wpdUHu4d9r6lbWhn
         qlL8JmRHbDxeAGMBLSJUw/TQtXEpkGMsqVqO2R9jgFAt3Nwa0Y7DORmPao4c5zV7LdL5
         1rKCEV514oz2lVEXb58JWqOQaJaPtY0UuVHSrV+zJz92D2cTHUlrKhVmkqu8XURdxsi9
         BRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761152699; x=1761757499;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=32wWVCnxfPxXwYEHrPhplOIt/hFbj1bnM86HXOsRbI0=;
        b=KizIhe9NOyikGNy06Anoh+QKpxC2vaJbeAaxJL2CU931V+QRCcWDRj2ZImafmbvCZO
         Tk7erGGrlSEt3pXRUnPlMfIT0LJdQzaqPFVazcaiAMGZlhUoUW74kXkxM8dzHVRAs6t8
         qT7XMUlfaADqF5pPu6IN2PtFoBCykFJ48BK6HxUWQN44jMwExdC9t3S5fAIZr6HkboSi
         HkCZRT6hch2kkmvK7LPtgVDUi4l3XVr3IKLrKYPmQ9ZdCZc8ZT5QZFl7a0eASOIwKogR
         7GLW6j6JgO+vkFWGTZf9jw6musZfLDXs5fVV7c3v03v4MMpTP1qXMSLck1jT7q9U+3uw
         DKWQ==
X-Gm-Message-State: AOJu0Yw302rjSj2TRtn27hI2YmNtF3iG+HMI6mY2M6CkZCh31qfIuEHZ
	1E3+PQVGeKcJSgM6P0/wlMxdgsMCqbXjxNTaLjmlVqrIDvVLzvn8PwukBFuddnEFI68=
X-Gm-Gg: ASbGnctsPEIu4NHsGY9CrMkphvxrUp6LeTUoXeaCpHG4ZNTJEUSu5vi2YeaVcr41IJB
	NMNDVFaupyaniEKMR6aItpl9dteCtC9mDJ3ksmnxrLp8N1KTwurahXTIrSNuslzbj/HcaUYR16Y
	SeQ8BNTUaHivR72g1jcqDPbIuUKqrP9tOHCqeQc66zwVXrzl4S9B9K0Z1hWsJKNio0hMkwJ3iJg
	STK3KLqgVkN/EANYdlCol94abiXaHVwNbBs5V2JPPB+1tHV0QMA1oXO5Mrg7o3IjJUO2VEWqrtl
	9TNPCeioO3xQnR1ozDiiinPA/Mmv//VZnzGqBntHfSP4eEk6jD3P44W8UH6mht208HKZJjlI1lM
	S+GbkHxEjd8n6vIyNjIdRWihUEl0rX8E9ngnM47mFVwwdTx2+7hbHoIsGVpjTWdiXWYDd3JjAGx
	aw7WPf
X-Google-Smtp-Source: AGHT+IFmj2XqRZSV8uq6JK5/wuWcy7s7skNAC2uPqQiciaWffxUPCp6My9UDZBTNxMujaGi4I4wsdg==
X-Received: by 2002:a05:600c:3554:b0:456:1a69:94fa with SMTP id 5b1f17b1804b1-4711789e374mr126327145e9.13.1761152698935;
        Wed, 22 Oct 2025 10:04:58 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:11f4:2b3f:7c5a:5c10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-428567cd83csm3271205f8f.14.2025.10.22.10.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 10:04:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 18:04:57 +0100
Message-Id: <DDP0J063IX84.2MC5D16VHRFVR@linaro.org>
Cc: <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sibi Sankar"
 <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345: Add
 Left/Right Speakers and Tweeter
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Abel Vesa" <abel.vesa@linaro.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251021-dell-xps13-9345-enable-audio-v1-0-6f3f6bbd977b@linaro.org> <20251021-dell-xps13-9345-enable-audio-v1-3-6f3f6bbd977b@linaro.org>
In-Reply-To: <20251021-dell-xps13-9345-enable-audio-v1-3-6f3f6bbd977b@linaro.org>

On Tue Oct 21, 2025 at 2:50 PM BST, Abel Vesa wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>
> Enable left and right speakers/tweeters on the X1E80100 Dell XPS13 9345.
>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 139 +++++++++++++++=
++++++
>  1 file changed, 139 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch=
/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> index 58f8caaa7258077d2c267048ca048279109ddb71..a05dfe2c51364b3ec04963590=
d9b02b9fda9f336 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> @@ -151,6 +151,50 @@ linux,cma {
>  		};
>  	};
> =20
> +	sound {
> +		compatible =3D "dell,xps13-9345-sndcard";
> +		model =3D "X1E80100-Dell-XPS-13-9345";
> +		audio-routing =3D "WooferLeft IN", "WSA WSA_SPK1 OUT",
> +				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
> +				"WooferRight IN", "WSA2 WSA_SPK1 OUT",
> +				"TweeterRight IN", "WSA2 WSA_SPK2 OUT";
> +
> +		wsa-dai-link {
> +			link-name =3D "WSA Playback";
> +
> +			cpu {
> +				sound-dai =3D <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {
> +				sound-dai =3D <&left_woofer>, <&left_tweeter>,
> +					    <&swr0 0>, <&lpass_wsamacro 0>,
> +					    <&right_woofer>, <&right_tweeter>,
> +					    <&swr3 0>, <&lpass_wsa2macro 0>;
> +			};
> +
> +			platform {
> +				sound-dai =3D <&q6apm>;
> +			};
> +		};
> +
> +		va-dai-link {
> +			link-name =3D "VA Capture";
> +
> +			cpu {
> +				sound-dai =3D <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +			};
> +
> +			codec {
> +				sound-dai =3D <&lpass_vamacro 0>;
> +			};
> +
> +			platform {
> +				sound-dai =3D <&q6apm>;
> +			};
> +		};
> +	};
> +
>  	vreg_edp_3p3: regulator-edp-3p3 {
>  		compatible =3D "regulator-fixed";
> =20
> @@ -415,6 +459,13 @@ vreg_bob2: bob2 {
>  			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>  		};
> =20
> +		vreg_l1b_1p8: ldo1 {
> +			regulator-name =3D "vreg_l1b_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1800000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
>  		vreg_l2b_3p0: ldo2 {
>  			regulator-name =3D "vreg_l2b_3p0";
>  			regulator-min-microvolt =3D <3072000>;
> @@ -880,6 +931,32 @@ &iris {
>  	status =3D "okay";
>  };
> =20
> +&lpass_tlmm {
> +	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
> +		pins =3D "gpio12";
> +		function =3D "gpio";
> +		drive-strength =3D <16>;
> +		bias-disable;
> +		output-low;
> +	};
> +
> +	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
> +		pins =3D "gpio13";
> +		function =3D "gpio";
> +		drive-strength =3D <16>;
> +		bias-disable;
> +		output-low;
> +	};
> +};

Recently it was adviced to remove output properties for gpio and
non-gpio functions.
For instance here: https://lore.kernel.org/linux-arm-msm/39ebaf4e-e91f-4568=
-8de6-9fc1f805a1e4@oss.qualcomm.com/

These output-low should be removed.

After that:

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>


> +&lpass_vamacro {
> +	pinctrl-0 =3D <&dmic01_default>, <&dmic23_default>;
> +	pinctrl-names =3D "default";
> +
> +	vdd-micb-supply =3D <&vreg_l1b_1p8>;
> +	qcom,dmic-sample-rate =3D <4800000>;
> +};
> +
>  &mdss {
>  	status =3D "okay";
>  };
> @@ -1067,6 +1144,68 @@ &smb2360_1_eusb2_repeater {
>  	vdd3-supply =3D <&vreg_l14b_3p0>;
>  };
> =20
> +&swr0 {
> +	status =3D "okay";
> +
> +	pinctrl-0 =3D <&wsa_swr_active>, <&spkr_01_sd_n_active>;
> +	pinctrl-names =3D "default";
> +
> +	/* WSA8845, Left Woofer */
> +	left_woofer: speaker@0,0 {
> +		compatible =3D "sdw20217020400";
> +		reg =3D <0 0>;
> +		reset-gpios =3D <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "WooferLeft";
> +		vdd-1p8-supply =3D <&vreg_l15b_1p8>;
> +		vdd-io-supply =3D <&vreg_l12b_1p2>;
> +		qcom,port-mapping =3D <1 2 3 7 10 13>;
> +	};
> +
> +	/* WSA8845, Left Tweeter */
> +	left_tweeter: speaker@0,1 {
> +		compatible =3D "sdw20217020400";
> +		reg =3D <0 1>;
> +		reset-gpios =3D <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "TweeterLeft";
> +		vdd-1p8-supply =3D <&vreg_l15b_1p8>;
> +		vdd-io-supply =3D <&vreg_l12b_1p2>;
> +		qcom,port-mapping =3D <4 5 6 7 11 13>;
> +	};
> +};
> +
> +&swr3 {
> +	status =3D "okay";
> +
> +	pinctrl-0 =3D <&wsa2_swr_active>, <&spkr_23_sd_n_active>;
> +	pinctrl-names =3D "default";
> +
> +	/* WSA8845, Right Woofer */
> +	right_woofer: speaker@0,0 {
> +		compatible =3D "sdw20217020400";
> +		reg =3D <0 0>;
> +		reset-gpios =3D <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "WooferRight";
> +		vdd-1p8-supply =3D <&vreg_l15b_1p8>;
> +		vdd-io-supply =3D <&vreg_l12b_1p2>;
> +		qcom,port-mapping =3D <1 2 3 7 10 13>;
> +	};
> +
> +	/* WSA8845, Right Tweeter */
> +	right_tweeter: speaker@0,1 {
> +		compatible =3D "sdw20217020400";
> +		reg =3D <0 1>;
> +		reset-gpios =3D <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "TweeterRight";
> +		vdd-1p8-supply =3D <&vreg_l15b_1p8>;
> +		vdd-io-supply =3D <&vreg_l12b_1p2>;
> +		qcom,port-mapping =3D <4 5 6 7 11 13>;
> +	};
> +};
> +
>  &tlmm {
>  	gpio-reserved-ranges =3D <44 4>,  /* SPI11 (TPM) */
>  			       <76 4>,  /* SPI19 (TZ Protected) */

