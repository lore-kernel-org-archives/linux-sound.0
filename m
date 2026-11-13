Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602017;
	b=C+XjsaJj+neQZsUUapQ8Sle7HfiuGeOF61W/0gZ+8oIYO0iSGhPJTRxUus9CQt+IWJIa
	 gQM/zxerXMdwnxYyt8VixdmfNnF6knDtShTCcNsmRlvf6HidDFITQgTMtMK6cWtm05Voa
	 6ovW2Q3brLOz1SFo440j2zTxw3NKwFhzbT02+2E+eaDbQrYZRctMaKD8+leUpzXY2FKS+
	 Zmu9Mtl8nwE+OqnXHID9lmbM78C0sIYuxGVEwIv1nNjwLUs2ECTU/B4KGnZA/Mq+jjPqd
	 J4n00J1S4MY8xInop1RmAYn6UZZsYtm0+2s/4BV6dVf0DsxSzlzq24LIicpp2qupYsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=gEGhQyig/fNEybsXDYKz1iMP7UMP4XGYfAVUX5I4Sh8=;
	b=Du8Q3K7DIlOCTDD3TjABBo0AFEf6PJ8zoVrvYo9yLDFx78rDLXHRY2KC1DK9u5c62Sp9
	 MC5sz35mkSfb0g4MeKB2W6zy4Q2aEIzlJgU5fn4W6f/vXxLMxlDPBYI1e2NO4MoZNlF4N
	 Gr8OikhcJbx26ug+VbQ5ImuGn2Al8gsWSBIEXqO15VwOmsHHwMjBdRvEnf+RoY+Dp7yNz
	 ZUNCqaf8/AU1vcRe2TAAV6R0Q7estYPtK/nwsedVKG/RcDHqzMtZ4moh+q5zy9ZY67xOK
	 h+mzHCyJBCSnKIVo/4aFb0BPK3N89UIBJDaq+d36Sr0gG+iLNU8QBt17K6pnqqmvyDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wSY5bQ6m;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0E0606A332
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 20:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B0E0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wSY5bQ6m
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so21224465e9.0
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 12:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602015; x=1795206815; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gEGhQyig/fNEybsXDYKz1iMP7UMP4XGYfAVUX5I4Sh8=;
        b=wSY5bQ6mHQtE7OEqfQyqajUidx6WmK8z/6DgbSY4eXxeMaI2cn/UEYpePyM6Dka2jV
         6jGyEtVtq4E+truNrt7G16Tso1F+brW6nQ6kzxtDVypoYSx5Sq2l13+8p2v5xWBj6B77
         ux6letY3KZbzw0JyToVj6Jofc9E164wVGVQhHkwlbp7e2w9iqbhQGeWYIUonXe/PUq/y
         xz5Nv+4VJewgv8F0A+TgTEmH5jweg4iZyDhbagMHF1uL1W27oa+/eaqGxJuos3mjBo3c
         nxq/dXf75zueN++GoRfXIu43thk85yIou8Xtl/GzocW2Pu2WUNse720dwfcS6dJswdae
         CaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602015; x=1795206815;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gEGhQyig/fNEybsXDYKz1iMP7UMP4XGYfAVUX5I4Sh8=;
        b=zWg01wYUCOAkttGmdwaAdZr3UN2MT/ATxXQwMpOmYPc/4tyCHNNT0mZ9KWSj8kxC2D
         /cQRugCoEi6+6HJngBgZO3nGrrGu3qTQSx7c3ibaRnhDbkpIz0462WfzQhlx9zYTJ/o9
         yGUfZu0N721CRPRPMhRRErcuzJxOP+Zy1dY7uvpe6zk+wjlgPcaixrWIb3hFaa0T4kJB
         ewhyuZMglR2qjCB5XkojNPMDryXF9qNeX5fn5JdyLIHq8fUdZDc/8dLK+9/ymXQhd8xq
         PVQtYrHQwhYLmlmPkhrBm4RpoO1zWx+9ytwhSKEKSpd9Scjw+VtkJZdRJ4eAdvrOTJ5o
         5qyQ==
X-Forwarded-Encrypted: i=1; AL+hErFCJEQ12hacIOKsdDpzZBfN58f26jtPjjopLycyxiarYlI5fu05irX/6QPl+HTaGOKWiL54cjw7HHD4vA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VESsPHpbeQgEoqwdGwc/KbmmskdJhxQTgS76sHPtzfofa02cb
	gLIMNXbHG8EMTkeG5FiaotYSv6lpleqFRuN3guzsSHzHVsdg3xc3jArMBYNtrQ==
X-Gm-Gg: AYBFou1mzOQxKyG1j9w5piQHxlH+k+zZBkAFg+rrSSUy+rJZLsWAX8spO3PnJG1acIL
	XvWKEFzvM9bA1K8YJxw/dlavl4xI5y3NBhoQzp4M0UF5UEm9TWXPIshvXGG4XdBcRBhQSS8xfEo
	ZNfSXjQsULoMVkF1TKCA8RGbkq2Ff+03BIDXigfp8un7UAno+yD4/yzi6U44/hlxNATeHyoUvTd
	G0nZ8jhOikuhvi8KYiCW3jjjZkMphXplmvTss6n4O6G2FGP8ydF7umW9aEzkfp0hQIHfpRa24IQ
	SoaB9Uj0DxBBN15C4j9hVFoKH/xcDbJF+TKgbEHia/xn2pYdpukV3dnfKKmLbM5jXqg2OwWzCHK
	pYAdJKQLiA0rX4X+8hY0ZLtr74zI6w4RmulVqiIh2/Hf+Upd2fywZWpad//2Msaok7o2doxmdjm
	mcUurMENcWT0djM+zShiWKL3bYbPn61HfcHVuhis9gDxXMzXnI0vVbbQVdrqU8uEg3TIO0+uw59
	pjMEq5j3qNb2nDTMdApx2TDcHWfXeT5yDUoQT4a///ocBrwTyAP
X-Received: by 2002:a05:600c:e558:10b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4bb55a96404mr55295145e9.23.1794602015435;
        Fri, 13 Nov 2026 12:33:35 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5667a8aesm59897995e9.1.2026.11.13.12.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:33:34 -0800 (PST)
Date: Fri, 13 Nov 2026 12:33:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 vkoul@kernel.org, tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
 abelvesa@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: =?utf-8?q?Re=3A_=5BPATCH_1/2=5D_arm64=3A_dts=3A_qcom=3A_add_device_?=
 =?utf-8?q?tree_for_Asus_Vivobook_16_X1607QA_=E2=80=94_v2_series?=
Message-ID: <9032798812284dd2842cbf003c75cc0b@gmail.com>
In-Reply-To: <5a61c395-9eef-4c97-99a5-30f434ad2c7e@kernel.org>
References: <5a61c395-9eef-4c97-99a5-30f434ad2c7e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

SGkgS3J6eXN6dG9mLCBoaSBhbGwsCgp2MiBvZiB0aGUgc2VyaWVzLCBhZGRyZXNzaW5nIHlvdXIg
cmV2aWV3IG9mIHYxOgoKLSBUaGUgYmluZGluZyBkb2N1bWVudGF0aW9uIGlzIG5vdyBhIHNlcGFy
YXRlIHBhdGNoIChkdC1iaW5kaW5ncyBmaXJzdCksCiAgYXMgcmVxdWlyZWQgYnkgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QuCi0gVGhlIGJv
YXJkIGNvbXBhdGlibGUgJ2FzdXMsdml2b2Jvb2stMTYteDE2MDdxYScgaXMgZG9jdW1lbnRlZCBp
bgogIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sLgotIHNj
cmlwdHMvY2hlY2twYXRjaC5wbCBwYXNzZXMgd2l0aCBubyBlcnJvcnMgb24gYWxsIHBhdGNoZXM7
IC0tc3RyaWN0CiAgbGVhdmVzIG9ubHkgdGhlIE1BSU5UQUlORVJTIG5vdGUgb24gdGhlIG5ldy1m
aWxlIHBhdGNoLgotIFRoZSBEQ08gc2lnbi1vZmYgaXMgbm93IGEgcmVhbC1uYW1lIHNpZ24tb2Zm
OyBhcG9sb2dpZXMgZm9yIHRoZQogIHBzZXVkb255bW91cyB2MS4KClNlcmllczoKWzEvM10gZHQt
YmluZGluZ3M6IHFjb206IGRvY3VtZW50IEFzdXMgVml2b2Jvb2sgMTYgWDE2MDdRQQpbMi8zXSBh
cm02NDogZHRzOiBxY29tOiBhZGQgZGV2aWNlIHRyZWUgZm9yIEFzdXMgVml2b2Jvb2sgMTYgWDE2
MDdRQQpbMy8zXSBBU29DOiBxY29tOiBscGFzcyBtYWNybyAvIHNvdW5kd2lyZTogcmV0cnkgZGVm
ZXJyZWQgY2xvY2sgYWNxdWlzaXRpb24KCkFsc28gb3BlbiBhcyBwdWxsIHJlcXVlc3QgMTQzOSBh
dCBnaXRodWIuY29tL3F1YWxjb21tLWxpbnV4L2tlcm5lbC4KCkJlc3QgcmVnYXJkcywKRGFuaWVs
IENhcnRlcgo=
