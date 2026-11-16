Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862540;
	b=DVS6/p/y9D0T2vI4TxI4rx7VVDZIhr8FZxg0S7VjWSP/1UNWXCtWleofqScOcaa8va6c
	 o2+Owg3TWansYyvbz7HTAZVF/o3BG3EDVAcwf2eJDdHmnn2oe7z/3mTdCtSTlaz7oGG3F
	 aIbbD9exQo/IqtWfejICaJgRKe+Ju0qCaLtvx0hbQrG49KgGCaWlPL+qRsC7K6CYPUqHN
	 Ibgau7PLRQAymIz2JBsU/4+YUx9kho9AXBGRdbWNVWHr7foMDC/cmSVU33ixixJPkf8X4
	 LvW7tzsS6py0e9Zdp7ubCNtRd+7qS+sILSGL1BifW6B7G6qynMR6G0Chren8Ln+ksqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=K1X6aptp9cb54EH6/S3+8Xic6Zq/P6tKc736rXZO270=;
	b=Fpy94XO8rxLwGczDwe5ADQQ4I2GGNCszLrrQHmIbi0VS35k29301QRabz+Kqpjk2zjHP
	 S8VV3mV13V8Qi96zNKFb11OVTHWSk0PRpR5xKveue3+9xhd10EncvuoAFVNP/BmTMkJZV
	 S964mLZ1CgcgkIHTQyDFgj21vKeCbCPHrAWLnOK7BMTkj/k5ZZh2hSnI2++zRtS3syb9b
	 Szzk/+bE9EEtMePWxg3pTqrJSEZ+mEe/yVz5ndflBlffVTVA54OXl9X7H60kaCKJ3vwkS
	 nimnBnMWMxAtXXpOgTyaYQ9Unf/mV4aSJiv1EPutOls+JcylRRVjuziJZkOZcxJ3yQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2QgY5C3;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB65606A332
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 20:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB65606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2QgY5C3
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a357b1c649so202179f8f.3
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 12:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862538; x=1795467338; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K1X6aptp9cb54EH6/S3+8Xic6Zq/P6tKc736rXZO270=;
        b=u2QgY5C3if5uWiUzZPM8txeCtbFhDBPrzEMoHeTc5cOUW1a6m+yJEOsHyjTGKYv5Br
         2hSq/IcbD6pZi+sd73S4n67ieExHp6zRxGM9IjP+O44xbz09zLMWbowhMeyyRAWGbIuK
         Q7Y8RY0lJKTIww8tbVcR0rzr+fKDLuN29Fk5SxwLtIviFdn7AyBhOC4fGiNLluF5QZ0m
         G9wxEbaF3SDTPQzdEUBgPeNz+y+ca2sV/soJ0BzaWB6rstoI+PF8XC135FGOfQ3f4Ijc
         J90MHeSJ3ULZMvmhEqS7GuyQzjZtkGPyRlPdp6pUkM98FxRrWTlOGvcW6eoD3yUkCBkS
         hv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862538; x=1795467338;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K1X6aptp9cb54EH6/S3+8Xic6Zq/P6tKc736rXZO270=;
        b=IUei1i1HeTwqcPqqfBdZSl1i5fj1qkO6clAa1gd23RzvlxguL3YKRPP69jzDvRwBrr
         QksK1Z+Z1fSJ4w8qH2CU7v1mqDpKXgukgKtBuG7jG2TDcuWToWvevQFgtADEh9McKlwv
         GyO/j6jmLQGV2owXEjctMmGa+oLAwl23icqWbpZ61qUBE99HuRg5mVxd27BreYgtQOk8
         UAPWPjd8NTN8eVMKblIdg3LctArx80WnpUoS0TrMpGHu1CP8WfdWTzUFV79U0wjk1P5p
         lScbvEHdLYEWii5b37FYTFV2M/CPwH807I/rrfbFBC8+3e7ttYFUv/NUytOAPfPQBGCf
         JeOQ==
X-Forwarded-Encrypted: i=1; AL+hErGFxgJvWJkz9v7vY6XsoGO2R7RuwkHUaUKAdJEhkNPYkRttF8USqdpR4d2d/ap55xqYX886d6wD81zQvQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+bqIyybSKFwM93GCuz5Mevcf1kaA0qv43scInVPJC007zLn3Eh
	AXu7U4p+m+OJ0TziJuBKoCMR0aHaFeIcpZtWJ9qBLAxlgLWEpzXlYOKB
X-Gm-Gg: AZFdTZevpOkdjDfVIXSBZjmunU+AXnd9ihPtTmCp4lBioLd7bDPbWemjGbuN/6ZXUIW
	r4t92ffeyiUrsA8Wbe4g01r4BZltlhu/wFOQccU7aQ7oPJsgeBfP8/0jwXlIsIN1r8otdNZjeJm
	3Zqz9pBxYYUG1ioQ4DyMISJP3qn3Z2AoCNY+c2Z0S647RaR4PF/XR0m93rmHLfdbBHSXs9sqt6X
	/32Okb3aD6f4iFbnWYLV7fWBNTHiWKuMZu68W6kRsMaXbbPw9NRUEO5oOz5RYOFBxi/V2fQq+VE
	Z3+Uw06koerwcgGq4bKh6+kv5VEGfVm1b2z7ue2vMkte8ZNWda9gUnFMGiC0WRBtHuN7tgCNi8i
	VLQEp+jcwtXsqH24EhM0uoXxjxYjCrelIKVd9Ot2n4IG40F0IBCJiG/ybQJ1rO7etXRjLiyIOQN
	en9qGhQU06t6+VyWKST3kvaZpvLZaT9FbgBTAmrDkdJxCuSeOnTUua9ARUVVy0WdT7v2+u53MwV
	4vD7tW0eCRf9DQPQJ8H23X02yvkoTeeGYamrFMHNlmvQe6x21E+JZ42
X-Received: by 2002:a05:6000:26c8:b0:491:ed89:a38f with SMTP id ffacd0b85a97d-49c73631471mr27391944f8f.23.1794862538469;
        Mon, 16 Nov 2026 12:55:38 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm24696949f8f.56.2026.11.16.12.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:55:36 -0800 (PST)
Date: Mon, 16 Nov 2026 12:55:36 -0800 (PST)
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
 srinivas.kandagatla@oss.qualcomm.com, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v5 1/3] dt-bindings: arm: qcom: document Asus Vivobook 16
 X1607QA
Message-ID: <954a5e65e7424694ba29836fba08c802@gmail.com>
In-Reply-To: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
References: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

RG9jdW1lbnQgdGhlIGNvbXBhdGlibGUgZm9yIHRoZSBBc3VzIFZpdm9ib29rIDE2IFgxNjA3UUEg
bGFwdG9wLApiYXNlZCBvbiB0aGUgUXVhbGNvbW0gWDFQNDIxMDAgKFB1cndhKSBTb0MuCgpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVyIDx5YXNzMjcxMDZAZ21haWwuY29tPgpBY2tlZC1ieTog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNvbW0uY29t
PgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20ueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sCmluZGV4IDEyMWNhNTU3Y2UxLi5kMjJm
MWIwYjRlZiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9xY29tLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9x
Y29tLnlhbWwKQEAgLTEzMDYsNiArMTMwNiw3IEBAIHByb3BlcnRpZXM6CiAKICAgICAgIC0gaXRl
bXM6CiAgICAgICAgICAgLSBlbnVtOgorICAgICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stMTYt
eDE2MDdxYQogICAgICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stczE1LXgxcDQKICAgICAgICAg
ICAgICAgLSBocCxvbW5pYm9vay14MTQtZmUxCiAgICAgICAgICAgICAgIC0gbGVub3ZvLHRoaW5r
Ym9vay0xNgotLSAKMi41NS4wCg==
