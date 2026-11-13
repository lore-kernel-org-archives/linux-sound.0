Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602024;
	b=2zG68PeFGJ29H8lDHl18oL1dsx3ALrL7nVWZO1N/eC2BH9WRulXkufcdzxif/JDb7DnB
	 19uwfJ1srSG/DPt4B6PwzvtqCRiQstDGJb+c9jne5H02/OW07RW9BwWS5ViGcNPtNj1nK
	 1PaWRfB5SdDPRPHB4SgK7HfA/ZSjlVSky9I+uXMWz4J9agYVkf+h6wZKfWzBUn9kIKjWy
	 tRq/YSZjCJUzDM2EryzC3XESZUca/mX/9Ou8BtPEmYp3vn2b9ta2FO9Rv2F3Z08O0/hF4
	 dBBMyZKfnnMTMubFMVoLsjsEu9bfFjCtc5zvVAvibjImNox+ZTLv5K5jYgSVTq1V+CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=Zd4UttbjYo11JO+n38BQnbl9AC/v736sfpYh3d6fEf0=;
	b=CANttGw5RTatkl21vjPuZE82a5DGw02P3NeYbWvS1BSejfLhiUvv7OzNpvD6paqjsZQ6
	 t4/F7XwL4wd9PRbmp/+ZzNK59KqDW2eaI6ciCaA4yj9mqTXq++tvlO4xELX7J0ZvqD7WZ
	 YOSYEib/x30Y8HXoAJUapcsmAWPFIcrniYqIVxmDBFt8Y5oixD/XHCCx7BVxAx8BeiITM
	 xNj7Mq5Qh4vcEiE3/+l9X4MLm1NY5Rq/x6Ht8phESDD4L4IBYNxS424dpudNQ8pemyWP9
	 /MiODcbqRIuCRE6iYaJycNU6xEK4xyvwu8B8FvfZz9vNkJ4dpy+ITV849oDGzjwx/7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KaTGq/QM";
	arc=none smtp.remote-ip=74.125.225.139
Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AB5606A894
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 20:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47AB5606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KaTGq/QM
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-49814d35686so846395e9.0
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 12:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602021; x=1795206821; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zd4UttbjYo11JO+n38BQnbl9AC/v736sfpYh3d6fEf0=;
        b=KaTGq/QMfrG+ztyqqp3U0jtvWTe7IwQIm0sWiGKq5xEqdbcADVGHsW1K3+5l1JwC5K
         uHSztfhTvNp2vKDKp1bxlN/IMin5/WBE6tfJZk8LKSCHgdM8Ai+rVF54UIO6sInKx835
         WimUBInSnkClOn1EXHV+7yIlbF5GLHQ+e2+EEYb/DOZ+JDG0Bqj7Asy1GrNc9nQwrISX
         IZj93ZttSaYcOGwhZJEvqWteyXrl5KZV6pXCrypVtNiGxHZwjY2ANL1xGDMmxM4ddPOj
         dfBedUknCHSsgYG7EnWtvWZJc9ZD3MFaKygDW6xz6gUAvkoirnq+uCQQZmEo0KXCYbV0
         kIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602021; x=1795206821;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Zd4UttbjYo11JO+n38BQnbl9AC/v736sfpYh3d6fEf0=;
        b=yIySPGAgSJAjNf28UO1eqeEUSJqXF0BTm7XhqPTb9f2j5anEuST8uNdzUVvU0kQYe5
         /655WvCGv5VGj6BEuxeQDnYQpgI22SSXo30jRmFvY049rftWF1LHR++SQ1Slpr5AfvGn
         i9tx57C3BsVfQajFq4/g8BO5dEB/5BxR56MnpQGOQ8uzbVijAYb8Fn8gFrGppwyNqMsz
         e5wGxuRDFVPZZmkxoxW2g65F50wTvazERPJPqqmEt3S442Jg1zDLwC3f/Bdi5QCZo/KT
         JbSmJIyiQe/d/Dc8NxRoXggOi+lFydoEMIEYS1qhiis740ktmtcUiWOEUIPXM56jPMmB
         Wy6g==
X-Forwarded-Encrypted: i=1; AL+hErG5blhkZORsoCZXAX29QssPakKPc9L69GwpFvVsqKOmOfoxFeXhsI54B1E06XU18fTzaGcHvN0YbKuNww==@vger.kernel.org
X-Gm-Message-State: APuU4Z+6Vh3Mt0/s4PTnGe2g/goaWvwjcdP7ZasATBWCDOVLTWPQ0YSX
	ptH0jM2MH37kH0VaCkfyXNYqj88PjMWRpt1s/NNVQp3T7n0h3UAw+wqI
X-Gm-Gg: AYBFou1a/Z6mW/WqQ3/8pzxflmzZr5JGcuWMf1UQT9NwLFDRUCICQEwu0JZFJFCtOJq
	JxBheOs2b1ihpuKuwU9SkLSESAamnEVYMkWF5twoyCY6W3Ph+sd4a0RVZs1Aeyc44oEJ7dLzdYs
	DJrT9zRVR5s02cy7zHwNRfoOIdI4OzlvWonmLtnTnMihzW0TpOHXUuArVu2i6d1OP9XU/aOrmzi
	AsPnx+wJxERh9rBBPUndBMi/ZtVsmKTx2co4FS+jgn1jtfKZjnxhix2QKdh6s7bWjxswcuuFqPQ
	EI6DsDwHj/9dA4uMSe0cBO8Dum+XONO+hG1X3Lw/DN6lDhcH862gHsITvu8Ner6d7zlFKRgKYnD
	s7Fui2u7HvG2YWDj+xzyUkIGgQe4FW8b1vR4gmEpUZzDwlQkRpBeEKXIfC/9xjOS46w9WRmdPii
	exXfzDxXQRifp4xjtNrHYpr7M1xx+iOFGeIhBDUeyXQObJYhf2ck0z7GCKKnXVzHBOKyTXWHhIN
	YkeOHRJeIYDmW/1W4+Yi06PNVJswLy/7uzEslQo5XlvKE9VGv4q
X-Received: by 2002:a05:600c:34d6:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb5599801dmr79325435e9.0.1794602021647;
        Fri, 13 Nov 2026 12:33:41 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5667a8aesm59897995e9.1.2026.11.13.12.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:33:40 -0800 (PST)
Date: Fri, 13 Nov 2026 12:33:40 -0800 (PST)
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
Subject: [PATCH v2 1/3] dt-bindings: qcom: document Asus Vivobook 16 X1607QA
Message-ID: <2c4a807496c04047b6d5735e3946dd16@gmail.com>
In-Reply-To: <9032798812284dd2842cbf003c75cc0b@gmail.com>
References: <9032798812284dd2842cbf003c75cc0b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwgfCAxICsKIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwKaW5kZXggMTIxY2E1NTdjZTEuLmQyMmYxYjBiNGVm
IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20u
eWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20ueWFt
bApAQCAtMTMwNiw2ICsxMzA2LDcgQEAgcHJvcGVydGllczoKIAogICAgICAgLSBpdGVtczoKICAg
ICAgICAgICAtIGVudW06CisgICAgICAgICAgICAgIC0gYXN1cyx2aXZvYm9vay0xNi14MTYwN3Fh
CiAgICAgICAgICAgICAgIC0gYXN1cyx2aXZvYm9vay1zMTUteDFwNAogICAgICAgICAgICAgICAt
IGhwLG9tbmlib29rLXgxNC1mZTEKICAgICAgICAgICAgICAgLSBsZW5vdm8sdGhpbmtib29rLTE2
Ci0tIAoyLjU1LjAK
