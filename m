Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A091B2196;
	Tue, 15 Oct 2024 14:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729000900; cv=none; b=GrYOvKZmLZyC2n/cfr6Z5Vab+GDOhyPQcp71BUu1NgpOLoN7YL6YYNfj5LpyDuppx4LONxC6wepN6cFl6edE4ABgUJ0CX/J8hCrwwWSL+Fx0b4K2EHplnvfrWVy+0NRf8+mV1pafkqeI1HCAQB9fJPzyEXLf+igNfgNf7Q97tyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729000900; c=relaxed/simple;
	bh=N5Gja8hJEy6mbg+GU072T7CfhtpT74yUKbjJvg4sMu8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=DJhot9VrfFRgsc0k14MKg4jEDAt8ZZgZwjj8JBazEKZ0TwNW7klRWK89tu6lprxb0KBPTka0ZWtvYf+Z0O2XJQI7VbgDTyahpyA7srQ8MHisc3CoHH+sA2zLJYLgTjRu31df+AMbq2YKlTJCD7zhgcu1/nmMWUtqENJz0F8wJ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJOyu7kR; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJOyu7kR"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-715716974baso3164453a34.1;
        Tue, 15 Oct 2024 07:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729000898; x=1729605698; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N5Gja8hJEy6mbg+GU072T7CfhtpT74yUKbjJvg4sMu8=;
        b=iJOyu7kRv8JkLi8E8j55jRSmdxBpkcr65CNNGhoEAg2g9q5BQpC8DnHxtPUiWcv+C9
         orde17gsa5lAMeyYcnx5XdZVP2TUzFb8k8J1dXIePOegHsgkSH+m/pNYg8R5G4QRmw+h
         VCqNBh8jI+awLl6Dzg15KC9I99p9TxCvCeovsRAD6Ol1J3RtAzTPB7mJrEotbUkBqEZ8
         BwaVD0BdIwp1+wVgpzUzWvF+xCUJg8vijYo/bNlRpUsDxQrQ2AuUws3hBm6xqUNBNu6z
         pjeE3puRy23OKFMWLqWFWWt3fG705PR2rvo/Exbh0qWI6G7BuzZnDFc9StOVzaJoRyP7
         Ih4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729000898; x=1729605698;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N5Gja8hJEy6mbg+GU072T7CfhtpT74yUKbjJvg4sMu8=;
        b=c2eIAdlaZgsCHqLorO5yqegggpZNEX4bGdxMOuH8/5p7BT4cS6rariAuBxPuwblr1u
         zk3D0Q38jlLOHy0RgJ1PJGrBAzevCJ0v7f6m904dXJ0fPNE+65VAVqkmOwpoZdq7PPBF
         /41G3l7V/XYmDuaHxJT55RvZlLlxojF8zr15Gu17LnHJS2A1h+DPHMQGZ24dgALC/Djr
         JqwIsuSTiJNMpqhX63wJLJLgKtyj80EkcM/x+Tb3THiT5by1G6uWcHF3Goneh56pQokr
         y/J/C0WO4gMuPvf08TNpTl4C3SNMIaBSeWWhs2FpavcR+QVDfkbR8iIYpTceNXHMqWnB
         xZYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWta0BssAQ9tdMsO8CPIf/xUr+veVo5x+FgGlcTD4pJukGN+IDUz4mqvl91Hzrokow+fpcaxBF7hAT+LOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW7YvGJGyvX5hgWpMxt1r/OzdCXMUBLL4rnBaQKPmTVITEy7Q8
	AVyqhd3s7KeueRovDjZd0Ta8+QRDVhZCbif3g9KocQl/A3GkgKJ7sFCZRV2HRpBbAbNIAUnRjY1
	fF+s//pNkPmWBnXyvIV+J4V8VSSwiARZScbA=
X-Google-Smtp-Source: AGHT+IEqKh6lwdt/RLJr2ER5oROvma135kgxaikWA9lsGqFByreREEidSaR1Dq7Pq9l6xiouvfJidM+K095P/lAR/bw=
X-Received: by 2002:a05:6830:4423:b0:714:fc39:6f2b with SMTP id
 46e09a7af769-717df2f1316mr6702987a34.16.1729000898225; Tue, 15 Oct 2024
 07:01:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?0JjQu9GM0Y8g0K/QutC+0LLQu9C10LI=?= <ilyadud25@gmail.com>
Date: Tue, 15 Oct 2024 21:01:39 +0700
Message-ID: <CAPsZJ9WXAeEW=oPKn2F9zC8GHwoiQ8Ly93480c0oxjY9xOCsUg@mail.gmail.com>
Subject: [PATCH] ASoC: amd: yc: Fix non-functional mic on ASUS E1404FA
To: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	broonie@kernel.org
Content-Type: multipart/mixed; boundary="0000000000005b6403062484648d"

--0000000000005b6403062484648d
Content-Type: multipart/alternative; boundary="0000000000005b6402062484648b"

--0000000000005b6402062484648b
Content-Type: text/plain; charset="UTF-8"

ASUS VivoBook E1404FA needs a quirks-table entry for the internal
microphone to function properly.

--0000000000005b6402062484648b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre id=3D"gmail-b" style=3D"font-size:13px;background-ima=
ge:initial;background-position:initial;background-size:initial;background-r=
epeat:initial;background-origin:initial;background-clip:initial;color:rgb(0=
,0,51)">ASUS VivoBook E1404FA needs a quirks-table entry for the internal m=
icrophone to function properly.</pre></div>

--0000000000005b6402062484648b--
--0000000000005b6403062484648d
Content-Type: text/x-patch; charset="US-ASCII"; name="Asus_E1404FA_dmic.patch"
Content-Disposition: attachment; filename="Asus_E1404FA_dmic.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m2aifri80>
X-Attachment-Id: f_m2aifri80

ZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9hbWQveWMvYWNwNngtbWFjaC5jIGIvc291bmQvc29jL2Ft
ZC95Yy9hY3A2eC1tYWNoLmMKaW5kZXggYWNlNjMyOC4uZDA2YzE2MiAxMDA2NDQKLS0tIGEvc291
bmQvc29jL2FtZC95Yy9hY3A2eC1tYWNoLmMKKysrIGIvc291bmQvc29jL2FtZC95Yy9hY3A2eC1t
YWNoLmMKQEAgLTMyNSw2ICszMjUsMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVt
X2lkIHljX2FjcF9xdWlya190YWJsZVtdID0gewogICAgICAgICAgICAgICAgICAgICAgICBETUlf
TUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgIk02NTAwUkMiKSwKICAgICAgICAgICAgICAgIH0KICAg
ICAgICB9LAorICAgICAgIHsKKyAgICAgICAgICAgICAgIC5kcml2ZXJfZGF0YSA9ICZhY3A2eF9j
YXJkLAorICAgICAgICAgICAgICAgLm1hdGNoZXMgPSB7CisgICAgICAgICAgICAgICAgICAgICAg
IERNSV9NQVRDSChETUlfQk9BUkRfVkVORE9SLCAiQVNVU1RlSyBDT01QVVRFUiBJTkMuIiksCisg
ICAgICAgICAgICAgICAgICAgICAgIERNSV9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiRTE0MDRG
QSIpLAorICAgICAgICAgICAgICAgfQorICAgICAgIH0sCiAgICAgICAgewogICAgICAgICAgICAg
ICAgLmRyaXZlcl9kYXRhID0gJmFjcDZ4X2NhcmQsCiAgICAgICAgICAgICAgICAubWF0Y2hlcyA9
IHsK
--0000000000005b6403062484648d--
