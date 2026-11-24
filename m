Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524985;
	b=Qxkh3hT842ZCWl9Qt3z0+8NOmaHASziFg0C8VtOWwo1M21V1ouEMTA6T1vxQJ9MbzSiL
	 Y3GMcPQcpNbyGswYCGVHLn7FkdsMhHEwiZMAxGyXHv3tZGyQwJQvO8m7iLRXEdhGcGoWv
	 z2QjOOgZ89HPTns1QoZDSVPkWkTUe9QGHuuba+SnRyCBzOapsmXGLFoXKlFKcGfW8kyI+
	 ycaIVvEM41nxlu8kdYzNbMsLzkupz96Wy3w9wIzDkTzXXw6aEP4CchUaWjOrq9wBsx+aO
	 LqGO7TjS8Y6DrEKqHQMwTcwb1ViIrnJHCHigsAZNFXUgDhyABKeOmnLxxV1BrnF5mhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524985;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ilSc/fGp7IrXQ5CYiNzRyue3FTRzaiLPQas5DwVLbCM=;
	b=CfAqliWPs28NlaBMeJ7+7Ml2RrN3oM4iHtV+EoqkfWH6lU61qLJ/1LT5VVCK1qbRLt7m
	 ZD8QZj/x00UoRNSND1S8VMxggLoGXZBlfxCB45EWReYwLbvdte9UKwmckB2gRV2L/p8E/
	 GEj5i5cavLOzO0dJnheACycZ/+OMXXb55ti+rE8l/pb6/oUQHFfygIhWwuCBx/z8UdutA
	 nJyt+rz0bsK2hNrPrFaw+Nygii4Ftvw7Moexoa27SJDJwcX4RUcscbKKtdJ9IzDg9h1So
	 CdcjHHpZnuSsEtHSiXTKrsUDHTNFGXuWlUGo/XVz7+YvrkNUB+7tohegfipu6aVOC+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pobox.com;
	spf=pass smtp.mailfrom=pobox.com;
	dkim=pass header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm2 header.b="O2n/qciG";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=lACXS5aH;
	arc=none smtp.remote-ip=202.12.124.153
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D1A606A334
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 12:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8D1A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pobox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pobox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm2 header.b=O2n/qciG;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=lACXS5aH
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 11D737A057E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 07:56:24 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
  by phl-compute-03.internal (MEProxy); Tue, 24 Nov 2026 07:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795524983;
	 x=1795611383; bh=ilSc/fGp7IrXQ5CYiNzRyue3FTRzaiLPQas5DwVLbCM=; b=
	O2n/qciGIMSdQhb4pbJghEepnydB68frJ2m3KeqOr1IYmOHHwrSm9X1xVO0gWEUi
	/K+r7jG7vaTe+oruOEDRHSbeywCJRZFa4rDNSoTB/dXDBszk4fLrC5T1/cvPnr91
	DEAjwx49xnXZKhrNu5Uf2fZdQDVZjUXnhg3AFuSb4TFRikPIs0KC24G603+LoR6K
	CPx4fluxaTZS97bcrBf70yxyZyUw+d8CSBFNkxgB6vF7SDTN7XbLHepv0T03oLPb
	Ta1o8HFofvuma2FoS5GVEjxkT0nBObCsAWh12jZtg/yUJ7tEtiL07siQY1jDOli3
	YLNniBa2gt7Dby2ibVLYZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795524983; x=
	1795611383; bh=ilSc/fGp7IrXQ5CYiNzRyue3FTRzaiLPQas5DwVLbCM=; b=l
	ACXS5aHA4YkCbOp1U6Qq1z+KjpJIed5XlLP+Voam8mSlWOlrWCjcJH/nToGDOULy
	xV/Nc6crku8scrh23+G2FXwpw19QcLavMMPxJ0eRKUR2NR6ky/xnPa35XGoS0cCN
	5qS4l17wCGu839YGF3ZquMhB72i6NhM1XZOLN5qlLGkJmpGafcswuh6LlUSKWyVC
	l+HVrY/fcgNtox2bcqSXh4h4M7gHf8UoBXMXXSF0PO8DF8T+PtpVAcxQKvBN9iMn
	7Rxi/ci3cctdJv7c3Hoa63JmSyinivX4+uICZI2H9hhWwjzuaXuFE8VX2Ehgy51i
	GPZbbuA6EvpBaYYtbD3Fw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pobox.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795524983; d=pobox.com;
	mf=PG1sb3JkQHBvYm94LmNvbT4=;
	rt=PGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:Q8eHqRfRl0qyRN8omaSsJFqUpXHs02I4/hIQ/We6Zt7cuq0
	QA+vo0zomG4gTEQz0PALyA+wO98zdjJ5xLy+DRru8xVi/9Ncp1255nW8f9COGTug
	qcLKO+dhK2gtixBsIH6hqBsOa6/xuZi6kjCA/I+5RfrytkrEwdrUXLIaVjsREu/7
	YRskSgZDcB3U3CTIgK8qgdZJ9UVnRdUSnpI0xj5hFWo9+Urp7JyKo9BZdb293/Po
	ESlvk5wsXlG1FdGl1lTVgTz4ss7EH5pK9TKWTbGrF2Jni331vxNMtuYG6vFFz/2T
	OzerQFtC5z0YHbvSzKDLRqLwMaeETCMJFsre0PQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:oiO7dE2cDwXnN38t0FpgxJEM8IVX8Uhh5ybPV5sCfwg=:ozc9SIgO3znuFCSf0aYg1EXzbzecYthivwoR9dGX4/Q=;
X-ME-Sender: <xms:d4kFaz9JNZPmF5QN92_sgUlXDRkt46Kwm3GBM_WKAaXHanFcbI2BVg>
    <xme:d4kFa3LBZGfczF4QiAWaMcGo-aQlJg9533FKdihn9avljUCJPDZ68Zgt4t-3FxJ-e
    JSv68pzpjztpa4B7iLxVtEZM1_4KaqJjqogzz2CSjR3_hD8VBKNhD_l>
X-ME-Received: <xmr:d4kFa-bRSPGaX56NTxwvhVkv6iAItCgV7qt5k1czqOzT9oBkk4JxM8n4IC5JZMx4y5W77vWH>
X-ME-Proxy-Cause: dmFkZTGqad0uasDzgQHLHaVh4vbviInq754AzLXvBmHiJ56sWFjdJ+sDxOs3XaTpwuhW0X
    LZD8xQB3apZjtViH3zOi8mi1947iZHKQuohCPoNnzMMY2+TajVnUMLo/pg3b3DgBjgJGy0
    B9K8uUJuCHR87Bzfrb0+iIGuLiTKJbk6w50z25nCRHgPdF3EEq+ZVTR1Qex1Tsvmh3AHj5
    H08rbeNUd6eqVBaRY+0k3dAodK2tFv2Yhmy2yVH8NoVYKM0d12a7LOdMwrcLuTJtykKr2w
    Tg3H/yyTtEwv1Mm4btCKQz69D9nVYhNaDSAviDWnCaRV0nCIYDLHLoUbZPGWnzC1b1OnM/
    l6I99nGv9tonQ2DSNUcLlP5LqRUdoxWDy04ECLMWS1U49jy6MhLIXkXTv5LBONG1ZbUX/B
    k0YHafBNc1WgBgw4lrFrYj4leZ8n9BxT9c2SnCo4QRMmLYQ/bZdoXvIXOj08PYu4KFy0JG
    YVhkiEIrcAxWuQOih3NtooVsodHyqqZRNMaDpAyE9JUj81IWb9FTonhWyN6uDN50KivLFX
    7GpcBDbJb5zn9vnJX7k61k2oSudW2P/KLoJ0+CMPJh3p9vqbKyX46K2Qm5haOGoj3Te92A
    DagEzbLktdAsbupPXxniU+hVxTJhUqrviktixixidZfN4XVjpfEFaAM0p4Vg
X-ME-Proxy: <xmx:d4kFa5KGaAXW4XM1_ZS7s4g2IzeAZQ0_HLvjMqjEs1PEJBUDpjoCgA>
    <xmx:d4kFa8DzYUuyxJwPZV2lJBdwRDm9HJNyKlEaaExEFoHb2iMMov23kw>
    <xmx:d4kFa-rJRFnDMpV8CSbt2y77MswiqoyLZfWal_GMn6UP4LWKwI260Q>
    <xmx:d4kFa3g-PU1ZxuRP5g8aokTBvY3xZOF9LW4Bo73-ALOIwoHItc-GPQ>
    <xmx:d4kFa_Bh2hh3lypqJRQ0xNOknw5wGbysL060lOb81D9dlD52Rag83vJI>
Feedback-ID: i55d94976:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 07:56:23 -0500 (EST)
Date: Tue, 24 Nov 2026 12:56:23 +0000
From: Mark Lord <mlord@pobox.com>
To: Takashi Iwai <tiwai@suse.de>
CC: Cen Zhang <zzzccc427@gmail.com>, linux-sound@vger.kernel.org
Subject: Re: ALSA: pcm: Unlink substreams before releasing them
In-Reply-To: <874id6bdsx.wl-tiwai@suse.de>
References: <c8132c27-b7d0-4867-a17d-89e4cf869c0e@pobox.com> <b8d3168a-b829-46d0-84fb-f964d116bae5@pobox.com> <c8bd572b-d5fb-4db8-a3ce-f9fc3e8153b0@pobox.com> <87ik1ndgkp.wl-tiwai@suse.de> <0D01CA13-AAF6-43B0-88E3-FA8B60DD77A3@pobox.com> <874id7d336.wl-tiwai@suse.de> <64ed6659-2a04-42d3-9f79-7abdf6b6dd13@pobox.com> <874id6bdsx.wl-tiwai@suse.de>
Message-ID: <E1C6473D-4008-405F-88B9-A5BE65D3B1C2@pobox.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

You will have to be more specific about exactly what you want=2E  What comm=
ands to run, which files to view/return, etc=2E  I don't have time to guess=
=2E=20

Cheers=20

On November 24, 2026 12:43:10=E2=80=AFp=2Em=2E UTC, Takashi Iwai <tiwai@su=
se=2Ede> wrote:
>On Mon, 23 Nov 2026 18:51:47 +0100,
>Mark Lord wrote:
>>=20
>> On 2026-11-23 09:39, Takashi Iwai wrote:
>> >=20
>> > Are *all* devices including both HD-audio and USB-audio gone in the
>> > broken state?  You should look deeper and compare in more details
>> > between working and non-working cases=2E
>>=20
>>=20
>> I am using the Kubuntu Desktop, and the Sound Settings in the GUI
>> show no devices whatsoever when it fails,
>> and many devices when it works normally=2E
>
>When this happens again, check what fails actually in details=2E  Were
>all kernel drivers probed?  You can compare the kernel logs between
>working and non-working cases=2E  If they have been probed, have they
>appeared in the device files?  Were permissions OK?  etc=2E
>
>
>Takashi
>
>> That includes each of these:
>>=20
>> HDMI/DisplayPort 1 Output (Meteor Lake-P HD Audio Controller
>> Speaker (Meteor Lake-P HD Audio Controller Speaker + Headphones
>> Digital Output (S/PDIF)(USB PnP Audio Device Digital Stereo
>> Headphones Stereo Microphone (Meteor Lake-P HD Audio Controller
>> Digital Microphone (Meteor Lake-P HD Audio Controller
>>=20
>> Since none of those appear with the culprit patch in place,
>> to me this suggest something is locking out the rest of the probing=2E
>>=20
>> There's probably a better place to look for more clues,
>> and I await instructions=2E
>>=20
>> Cheers
>> --=20
>> Mark Lord
>> mlord@pobox=2Ecom
>>=20

Mark Lord
mlord@pobox=2Ecom
