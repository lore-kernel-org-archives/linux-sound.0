Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483065;
	b=bWoQxP5GmJvn/HnvKgpAkaMkLAeb+R1BBv23DlRyvjdQpB/05fBWIZsTAVDUBmaE1t5F
	 MgW441HpKcAHgUiZvW/rGnh8aY9Hqeg648VptExYzDZ5ovBbb1MTfY2Qp0BWSr9gPE5cn
	 QZ2RxTGkI2+hLajZAM1m64oBCJuJnn5BDuzvnINMlpwHF7gdtsY9E5WJ0O/yNI82rWEEn
	 SD/Ll3Tar91Am081woW22YM/7FFF/O3PGZaXC2HuMY2/PPuOMYxAzFryEctjwjbM5COpy
	 r7usJ/h+zFFvUykr9a74bUSYr6iqlApGWTNFTH2wVq77ZJOB44kTWJqqASxY3ccH6zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=itmP4L3DXMSGmXVmoLrQUEVKU8nQc0azolCH6tmT1Xg=;
	b=hs2FEYcVOT/hvEJg9Rtx95EJZ/g/KWpoFOr2mURTE267xi251Y29ItygEtHSyMeH7Pbf
	 mpWp+gJ1ncROewt9MIFMEqzjB4gsUTnv1gnAOBsHTG+KhB1p+cU9pCmKY3c0u1wr1NgPA
	 TnPSE6ZK/ovkRSORohzsv3ZaaYMue9P6cICBf9eiP3vV8Xdy3TrwBmAMzGOZ+fI0WmEVu
	 Mace+gZAKjUBpyrEZxAtPrOFB29s4D9/rh33lpl773zmxW8H+uU/FVDpZ/okt4Y2zkoHF
	 iHg6ZJnjHNIRhauB7ZSiBmyKRyjOZ62dCsZGeGcfp7GWI+V5oHNTMqS5ed2HyJkB0+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i01IyUkS;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CC1606A321
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 01:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89CC1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i01IyUkS
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38644aedba1so6046068eec.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 17:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795483065; x=1796087865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itmP4L3DXMSGmXVmoLrQUEVKU8nQc0azolCH6tmT1Xg=;
        b=i01IyUkS0KDuGi4r0vPByL9Ph/bF+DMoLWNnGC5wDRiYFVB5FX+8LgDdJPGreC/onL
         GDTZvEtWSXzH9ZWWEGZVQwtuF0FBC8bBMoK2yBz4Wjbc/goC9bv1lq+ijZHB7M6dDyAM
         Rcuou1wycq3mqkzRV2/+hnCpFTpwUnm6EvVKW4h8IUtWyxYlPS7woChKvYYRu+/+ZZno
         btkvuAdDEdYbzNFS8Rn0aucLfJiHyLAjBKaiNJpga9ctbDtYN4CALtEC7Ju8mSVpt9m5
         bvaVQ/i/iiqWwpVU0EXroxtQ/Z3laiFt0iHeNXQNNjiXOnCH7WILCQKbqlrMLlNCKOWl
         a8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483065; x=1796087865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=itmP4L3DXMSGmXVmoLrQUEVKU8nQc0azolCH6tmT1Xg=;
        b=h0q75eMkpn6/uA0UueFnbqNdIiNWxkNwdInulsuelbVYMRMFoo074xu2EOy2POA/Ji
         eTbZSjNe4ITkOOCldCJAxkMEWCd3xEgBMjiEzdYWKyHhKhemngpYGFW9QQIuSq5+z6m0
         z04Vhp8oNfzG7guUVQH4CQEQmhyFL9wXblvpOjy98BanYfx7/nCy8fv95L7JkKvN29p3
         YH3I/2L+FTt0d306RRr393rpnEC49jtr74Vourc0AIqdWpWrOM8kHWp/bFgQPw/q0zto
         SF43UaQYH2R3yNMm9q7CSG6e7CITgfcQDew8Uv6Sz+jaYExXp64swPZh4pdoHLV5l+IH
         DkVQ==
X-Forwarded-Encrypted: i=1; AL+hErEA9714D6mx/ES3b6MiOcytgteMnp1QBBSIfqLAng9qYgKQGmyOpoEgBdzn2xVqZE6kDnDh4I19jI9iUw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZpxEMaRGjSsRasEjSvInIzLWeAGurxR6rIC4RU/GSRSfptX4/
	AZuFhlL6hFk1OnMHXVxa4USDF6GYrTqmd9028Tp4xUCYSNeGJgvNPYhJ
X-Gm-Gg: AZFdTZeOsfM+v11qXINjKwyZ0GCM78HGo/VLtQ9vVj9CacWkueT0zS5QRSoZYCehiEF
	GJ1y5jj+3l6yoqwVDLBQCuEAx6jhViYZqa03drs9H7mmYVVv5VoMIPiHJQTgQECNmymhVP5f9A4
	snAxzTKIlbPIU/RIbbNf+cYasHcGVP3VkB6syHR/elRun/ElWh6TvSrMNkvWzCxk89JNsucgWLB
	Ff6nZaRzeDq+WSU3t3nCEW6rzMYQF1Djmrfm0E2rnkGNkZHcCQiaWA1c2C/swFY9JbffuqS64jH
	tX2sMWBA+wbzdKImylSUkx8bIFOnxcJOYVFXOvvdyK1wYGU0wUgDvsFN3e4pT/KfIsDSsTHLGN7
	AuCCfrPvk61qgP2vEDveMWjfjbgS8/fNy8HAhH4HRxa+tWUQaymzf9KrROqGwxTQiFSzy+lIkg7
	C5Qo1fvuDZXJf5eves5Gh3H0+9QK8qK0VbVsetdzfftrIfq5SUlIjilPKdRFfYvBPJSWAE6POvJ
	vt8SVTowxFrvCU8+siTOeS784Qo4fdCsuGMXt9n0ccfMY+Auyu49c50xaBqHVuEyPPax2hkEUI+
	xsWFD1/JVGpHQlPAJDPtJkjwf2ounOmQSDKBiXrGjQRYhAcNwZKxZua6BVqRVwH8chZhyUYcoa9
	U4xyK92neAiiFeOrcCl1Rxm8t0tj+S2JQYQM0jn3C
X-Received: by 2002:a05:7301:4704:b0:383:729:cabe with SMTP id 5a478bee46e88-3856f8519ecmr14464834eec.19.1795483064438;
        Mon, 23 Nov 2026 17:17:44 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm15112586eec.0.2026.11.23.17.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:17:43 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/10] soundwire: stream: Clean up allocated runtime resources on config failure
Date: Tue, 24 Nov 2026 10:17:38 +0900
Message-ID: <20261124011738.395295-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123075522.405347-5-lee@kernel.org>
References: <20261123075522.405347-5-lee@kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Lee,

I tested v3 on the same Dell Latitude 9420 as v2 (Tiger Lake, SOF IPC3,
sof_sdw with rt711-sdca, two aggregated rt1316 and rt714), on soundwire
next afd88e7ad781 with all ten patches applied. Only the soundwire-bus
and soundwire-intel modules differed between the runs. Two local changes
outside SoundWire were loaded in both runs, my SOF control range check
and a debug print in rt711-sdca.

With and without the series, all four peripherals attach, and playback
and capture work on every endpoint. 40 start/stop cycles of the
multi-link Speaker stream pass, 10 of them after the links had runtime
suspended. All links stream at the same time, and Jack Out start/stop
while Speaker is playing passes. ALSA pcm-test shows 24 pass and 0
fail. There are no SoundWire or SOF errors or warnings in the kernel
log.

These runs only take the normal stream setup path, so the port and
stream configuration failures that this patch handles were not hit.

Tested-by: HyeongJun An <sammiee5311@gmail.com>

I ran these with Claude Code (Claude Opus 5.5) on the laptop.

Best regards,
HyeongJun An
