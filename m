Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261769;
	b=tgDzndc1n3Qx+QiLXtQJcn4ZUspnET+zuetkPrskWDlLeXVRlaXGl1UPvKkaGQdBj6Ud
	 OxRrZZlNTPYNmjNd51yjxOd3upkD1+crdln4RsU5r2u+cvJx4OYAUjp1msaow0ZefHLFw
	 Ly5jf5UQ01jJ5v7z0aQ59qlW3KpDBP/NYyY2PMwaqtomIZehQfUPZGgzQAPsfEhmtKkIn
	 +en25rhMqZb9OYw2BUD0pANSkwjLeQgbl0WZTw7kNF+zlhBpYxNUCKT/EUdkme+BlhAuA
	 9o0Gl+saMW8mhhKmlDxfRtxkNJXQqQF2VHAr/KgYdhlYQz9ArlDFG5PM+Nkm0oxE04A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261769;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=f5GWDo2XPwnBiJeUuiA/j9bntlOmdXOBv6QemznuEQk=;
	b=tGWmu3XNMWFhNKFaSrJrtMR8KMt8TF7dR/fge1ahG5iy5dT+AYUSKbhWj69y2BTHAsws
	 4KkKc7Z3fLQWXkh9SsbagbrkTwEs0os9Edy159g+NWCM4/38mLO6al6ub4W5NFWBRZloS
	 kc8+OjysJh9QbRMSfiUizYTgrub88NDXHaRBPfXONwKDGJWJ/C96vF5TlaN0EtlWq/NZW
	 2wAW0oXuQG35bhNs+1XCkPC+gtMG0ba1lBkHnw+I03tEOV1ASNSr8wMY1xgHvfVcPPTyR
	 ywWDlhDz2r6Vl4tdJFWrJxV2KFLupYUxPfMmXtQiTjWnJBbDrGkWqPoz4b6z+UqsJ8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=ytdxnkwipvhqldt27e6ansthhi.protonmail2 header.b=JqgkJ+I5;
	arc=none smtp.remote-ip=79.135.106.102
Received: from mail-106102.protonmail.ch (mail-106102.protonmail.ch [79.135.106.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F49606A31C
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 22:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75F49606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=ytdxnkwipvhqldt27e6ansthhi.protonmail2 header.b=JqgkJ+I5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ytdxnkwipvhqldt27e6ansthhi.protonmail2; t=1794261765;
	x=1794520965; bh=f5GWDo2XPwnBiJeUuiA/j9bntlOmdXOBv6QemznuEQk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JqgkJ+I58viMWIfpaapTy0SSujy5EpQRg+7vG9XnPMJGKXjMGunhBwWwUXbuafCdu
	 Ow+SU3Q2Exc2eHFJLrjsb8HZmO/M+UL3RptX1T51C/m1zjIalIMKtglHv+k0uWHrBZ
	 0nwJJ+/L4Od647bWxLp2RelY4KcOm0eFosQWMqo+bRltWWTIEIpWWf6serfeV2X8ak
	 wsiMBf/kWWofwkRdvkjtZ8UEJlQdnmGMnfFeUFKEL967WeulMLQ1/TXUpuWycz7Yib
	 HXjrOEPZ1FDNtrZZrr6TmCrFM3QNLPOdC1pOR0+LZiDqgKcoqCXMubai+tuX5HYv6f
	 yJf31gxsgCr6Q==
Date: Mon, 09 Nov 2026 22:02:41 +0000
To: Thorsten Leemhuis <regressions@leemhuis.info>
From: Rujbin <rujbin@proton.me>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Alain Cousinie <alain.cousinie@laposte.net>, Linux Sound System <linux-sound@vger.kernel.org>, regressions@lists.linux.dev
Subject: Re: [REGRESSION] Linux 7.4-rc2: Intel Meteor Lake SOF/HDA audio fails with ASoC route errors (-19)
Message-ID: <bC5e1B4L-OemXflaxyhu6hZVqEyiiGQ9_Q3cejRNYI2EMBnD6LC7sgT6bskk8FjeIwsbZviJBOmIGiz5t9xgfwAm9czm8ihYLGsqyVLHyjk=@proton.me>
In-Reply-To: <mSuMDKuVQS8ZjTjivGVr3SMDUYuxZDrlG8aM0vLajVxIN8eq7OJTwAtWLWgMGypqzNolhoAsat_-nBy0wAq09eap6nIDkUvCES32gFvZ7ng=@proton.me>
References: <mAZY9HZuXAXUf7zv8tqXquMtquf7iW2CIZB7WhU-SnwWp-Rpr0e8yixTsb3lAeQsO64PwwWlOao8aMjQ4hTKOQ6grCiNmaWZmFRXMdPICD8=@proton.me> <318f1745-acd7-430f-818b-c961987fe108@laposte.net> <1c28b5e3-7ddb-4e3d-a61b-a96aedd6eb50@leemhuis.info> <A2lXWpWj7wjBwPNTvCOh2-bCqRbX0Pb7od1dICr4c6SegAilwp8dERHk6riu7tj1b3XUMgcLnDDSP_8AoZAyj9VHm3NUkBB1NW2YPQfZLYY=@proton.me> <mSuMDKuVQS8ZjTjivGVr3SMDUYuxZDrlG8aM0vLajVxIN8eq7OJTwAtWLWgMGypqzNolhoAsat_-nBy0wAq09eap6nIDkUvCES32gFvZ7ng=@proton.me>
Feedback-ID: 45446246:user:proton
X-Pm-Message-ID: dba63f7dfaaa1fbb68d2bd764dce07d7819875f2
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Short update: the num_components explanation is now confirmed on
hardware.

4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to the
devm_kmalloc_obj() family") switched soc_new_pcm_runtime() to
devm_kzalloc_flex(). __set_flex_counter() then sets the __counted_by()
counter rtd->num_components to the allocated array size, but ASoC uses
it as the number of populated components. With GCC >=3D 15 it therefore
starts at 3 for "Analog Playback and Capture" instead of 0:
snd_soc_rtd_add_component() writes past the array and
for_each_rtd_components() stops at the first empty entry, so the routes
fail with -ENODEV and no card is registered.

The fix is one line right after the allocation:

    rtd->num_components =3D 0;

A separate [PATCH] follows with the Fixes: tag.

Verified on v7.4-rc2 (commit 7475ea8b58616), same kernel build and
machine, with only snd-soc-core.ko replaced:

                               unpatched     patched
    ASoC: Failed to add route       18           0
    fail to add hda routes           1           0
    aplay -l                   no cards    sof-hda-dsp, card 0

card0 is registered, SOF firmware 2.14.1.1 boots, and there is no
UBSAN, KASAN, oops or WARN in that boot. The loaded module's GNU
build-id (ccb6a039...) is the rebuilt one, not the original
(daa875d8...).

Caveats: the module was built as an external module, so the test kernel
is tainted 0x3000 (OOT + unsigned); Secure Boot is off and
CONFIG_MODULE_SIG_FORCE is not set, so this did not affect loading.
CONFIG_KASAN was not enabled, so the out-of-bounds write itself remains
a static finding. Tested on one machine (ThinkPad L16 Gen1,
Meteor Lake-P, Conexant SN6140).

Thanks,
Rujbin Nassereslam / zerox80
rujbin@proton.me
