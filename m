Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645024;
	b=m9CsjCiVUVGDVjSgrOZCh0/3DdOZZQpqlAeUCFUDtK1T6fVQMlEyMGiqK/Sb2CNf07DC
	 kRvqzPidxEuBBYgKmvcuMGJzKo823GSoHhDsQSFDkzwv6iMip06sW70VOGaXF9WrcdLUt
	 T3W1mvPx3jfxgPeL/XX7QaYfgn1vaCAaIG86sDIRgBridmGz1kPZYfuFD00IblTl2NRjs
	 y9OtasAcPo0xYIPYjlxFjjTBGN5Yw5cFsk4fosM22kkLVSLFflbbfPbecG7X09v6iUH1K
	 E9I+FtWTJ8i+sk+PJR83uhwAlXnNI4wMnOKVYGKvWDT1ZYpDfj3P1cDb8KYLbt1DQng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=ma8eOStbqsLgqHn7ahQBI4zgMkUeHZjSXOgEoYt70mw=;
	b=WSboGxZ6a1aGXLTSZLlsQuSY1S7/uaMYzk/UJmndmBxOlO6ltWNxmmeqs5ymzOcTFXUs
	 O6Jg/myEkSnBzlMeFNJquF94ecPwCzhWHes8sspx14QIadmr7WLzv5rggSbV7eXN3ZaVn
	 0n7pLny4hB7RHJPXCcXMY5Sf/zLwPZ6Pjvr/A8IYpToRMYc5fBQIsPcVyaeTofpZhNvao
	 939QSeyOwzAaZaH+YqI1e6GeHdBZu5KCagrwey7Ab6ZEXoqtgUK4cHmJA1OkQXDgwa4/u
	 5Gpf2soWPC1YzPFABExXkwa4lec+Gr0+zqiLU8S8BBDf7gGtvqdv5ETCx8h17cbNIcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qR56hQY;
	arc=none smtp.remote-ip=74.125.225.138
Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207C9606A32E
	for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 08:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 207C9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qR56hQY
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-4b76ade741cso5595455e9.0
        for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 00:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645022; x=1795249822; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ma8eOStbqsLgqHn7ahQBI4zgMkUeHZjSXOgEoYt70mw=;
        b=0qR56hQYIKWdOxVpc5j13KSOTAd8LvtSa09xdM/++9azQASY01VaY2/N7bIxkzHVQV
         uneV7DRJvWG+VRc6KRO66LSYMhG9aTuwpSiOFSv73W/DzetcCerEDzEnoxAr8js528EH
         nUTPKaAk8M3xhZbjAxaodYkT3bJ3vZzUrc8MD3nwb5I89mxzZ8VSalVq5w8Os3SC7Yv5
         Qab1tXA+MtQNKeBlFZJ32hBa4E++V/vEjpv+ymFD9oARpQcuAHbq1J9fnvsG2w1J6B2B
         xudgu0dFaFOYv9/QgA48S9Cxy+NlxC5paDnWBPdOaMkesuzTTvsuRwlZ24sDoPMGS3qR
         kEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645022; x=1795249822;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ma8eOStbqsLgqHn7ahQBI4zgMkUeHZjSXOgEoYt70mw=;
        b=OCRShpEddfs8yKFZPcazzR1jpbBcYsSzuZJujF200VwgfyMJwFk00sm4vZAVjzn8+r
         NINGhMPBW3YRbP3BC7o8+zCnnz98SVim9fun0H6hGSwPDb/CoRmRSPlZNN4PHDMkLlXA
         tKL5/PQOTsoPs5AU9ZtzmelWiSfNFOoQmfu3tMEyr2cYc4qqNEba8/t8tl/exTXeqQTY
         uS8NzmdwpGj7PkXGPGxqCdSLeJQsI9J0cgJDte17bS6JPqnz/ecPGOh92alkmOWukJ02
         +ENdRO6UUxznO40tBxNkmlD+0ahaEsIS0QWtAPj3RFBv19QIsbzAPC+fRTJ96v3Q07Jm
         QFPQ==
X-Forwarded-Encrypted: i=1; AL+hErH9S+OP+Cezpd2qzONY6oZHgklBvaVm7ysEc1RYp9xnNdmSxQEQAB6qRy5eTfLFJgNsnxOw8Hjl35tKdw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+cliS7m89msXtrh70XN43Y5vNgm/wgdJmISuKisIGSoxCmQmw1
	N4RNV8WneKx8ZdiuoWhRV8Gq050vuaQcDnIDYxGek4Smg9SikS5MXroVtOZMQcYokX0=
X-Gm-Gg: AYBFou1bIf4lJjCTL0pbTP+fQPMKtwo6DmuRGSq41WUaFzimZiCvKcjt+C59kiZ1SpD
	8CBqmWoPHKuxjy30nVmPV0JCubgZH4xTmoL7b0dLGGdflOBbeb73dQBW4e81r0fKO0AYUTd/2xp
	k0juJt6z88rg5ebhNmjZTgx+HtJEqeVY/Bby+Ao0QpfaUaEo5mdADnOTlq9HR2w1CmZXEdGGkou
	eyDYHz1J77jBaGXi6BQRqKDpEj3GmvWWx+VGWoMxavfaqqgJNy+MBvcBjdslFU8O8LtcJDiSll1
	7xpFUfC6MqdZhLHotE715C3EjREdeE7oNS8FMxEB+xFPiJ4yyd8Kk4hWO26fjf2g8vO5ocaIdea
	1jDzeY0632P1AkAEcYoK6RIGAnUYwbbBg6TNda0+6BQk2qEIJIDVU3JNRo6jB60SAxvfYvICiH6
	2bXXDnnCQKSzG1UhC5YbUjE3PBVrrWoJq952kBE1s/W9j8qLDUMLp0n5AJor4DnUZZ2otX0qj7/
	AB5hbNtTZkEvtFHXanU271Sq+Dhwa1JUOtSHrpL7mOlsKP3ley1
X-Received: by 2002:a05:600c:2c7:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4bb55a71180mr65200945e9.28.1794645022425;
        Sat, 14 Nov 2026 00:30:22 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm9834201f8f.49.2026.11.14.00.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:30:20 -0800 (PST)
Date: Sat, 14 Nov 2026 00:30:20 -0800 (PST)
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
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: document Asus Vivobook 16
 X1607QA
Message-ID: <ffa1da6790284f668c860bd21203014e@gmail.com>
In-Reply-To: <2dc9301fc1ec46cdb66dc49a85f721b1@gmail.com>
References: <2dc9301fc1ec46cdb66dc49a85f721b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

RG9jdW1lbnQgdGhlIGNvbXBhdGlibGUgZm9yIHRoZSBBc3VzIFZpdm9ib29rIDE2IFgxNjA3UUEg
bGFwdG9wLApiYXNlZCBvbiB0aGUgUXVhbGNvbW0gWDFQNDIxMDAgKFB1cndhKSBTb0MuCgpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVyIDx5YXNzMjcxMDZAZ21haWwuY29tPgotLS0KIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vcWNvbS55YW1sCmluZGV4IDEyMWNhNTU3Y2UxLi5kMjJmMWIwYjRlZiAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwKQEAg
LTEzMDYsNiArMTMwNiw3IEBAIHByb3BlcnRpZXM6CiAKICAgICAgIC0gaXRlbXM6CiAgICAgICAg
ICAgLSBlbnVtOgorICAgICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stMTYteDE2MDdxYQogICAg
ICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stczE1LXgxcDQKICAgICAgICAgICAgICAgLSBocCxv
bW5pYm9vay14MTQtZmUxCiAgICAgICAgICAgICAgIC0gbGVub3ZvLHRoaW5rYm9vay0xNgotLSAK
Mi41NS4wCg==
