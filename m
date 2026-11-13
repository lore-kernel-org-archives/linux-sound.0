Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576267;
	b=bSM4kQrYSu/QA0M4YlFe6UOArAcv7bd6ZCMuR5HoMuet+PPqHxPpa0r+wNmOHVmvqE6j
	 8hScIZ6qrS7B0+9HRk83PiKulrVJ5sp+xk7q/4H2Lg9X9wn5MpoMogdA3CD0qswHAUM1c
	 nwlZr8Uo7SsFoWQmcIhjItAGx5dfJCOvd+6YF3K7XgtHSL4mu6Szo3TpWSxIM83P/uKFp
	 ooCwB1sLHwLS4T/76dfWcd4Uyh+NxHAFrkR296KN4O2aQJEhh8MlXjrS44bfBbjdNBEmq
	 sdOqaPhAyfc3lT3P6t81nYptuP6sz4W/CDeSR7gDhUwWLORmOLRLQthFKevluJmbcqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:MIME-Version:Content-Transfer-Encoding:From:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:Content-Disposition:To:
	 Cc;
	bh=4bnNobTZYbRq5oUNwxT7VLNd05i6sn/OWm1B32EXBKE=;
	b=pIIL66sh24U9+R5ZGwb0K7WbMId1zrde8ifPIQ4cxv55Wpz+/PBW/QH9VtO1PRScXp1u
	 ChQNP7k4X3zsW4RE6TnlN5kKJppMawgY30riNnKr+eWe8sRxTiAiTJ4p/4pPBVusYXrXo
	 B/cwmmqO0Q9WbkHP9HHi7+Z76Czvu9BLBtLKva+8KYftfKz6ShLl2rAiGk19WvLQommZG
	 +CbfLc6CSICttIZPuIVjWTQvV1uBQO76bEJvB1zRWpV9jRnADZQ8ekwkPjcVLBnN77LsL
	 mul1Nztos9zPTCz3Oo/cBl7oEZPtZhn1YFeHVrpkglfvBlMcztrNqWzmZVIOzdvJtkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MXsmNfMk;
	arc=none smtp.remote-ip=74.125.225.72
Received: from mail-wr2-f8.google.com (mail-wr2-f8.google.com [74.125.225.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2534C606ABB6
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 13:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2534C606ABB6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MXsmNfMk
Received: by mail-wr2-f8.google.com with SMTP id ffacd0b85a97d-48df4afd489so168861f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 05:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576265; x=1795181065; darn=vger.kernel.org;
        h=cc:to:content-disposition:content-type:mime-version:message-id:date
         :subject:from:content-transfer-encoding:mime-version:content-type
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4bnNobTZYbRq5oUNwxT7VLNd05i6sn/OWm1B32EXBKE=;
        b=MXsmNfMkwmrtzH5QjA2Wxfle+/oOPLkWAIi6ePOk/jbUkUf8919leGBOnEaDEKyqUF
         63XyT4w2k54VUgxbkgF87CmSk4kBwa7mGWNgsu37iC7SdvqLPNVm148QmlA/lVLyZLBk
         5ecd6w/ciPaYgxpW3VU6mRTOSwEyripecZW++PkhfXPQouAY6vUlLpy3dZII/WgBSyzV
         MLuqoZNff+l8SDfNOvkSsOZrU49UGiTb3RhlWr2Sk/7LBh00bwFjWInjB3OjyetRvrY3
         u3yhSqV1yi/w+7jrqSo9Ia7xHTRR94OM3faplZg9BwBuaCaY8sbI3VFyaudztnDV1b/j
         EW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576265; x=1795181065;
        h=cc:to:content-disposition:content-type:mime-version:message-id:date
         :subject:from:content-transfer-encoding:mime-version:content-type
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4bnNobTZYbRq5oUNwxT7VLNd05i6sn/OWm1B32EXBKE=;
        b=DeSPmvBG28NcTJIlIHnBXkaPWsNIWIYGboCXJGkroykE1e2pbelaREPsRUVbtLbyjS
         ZUZhh7tIYw068sBqvlvrNgU3CTIylF5PKdFYs3NQHu/wJWrysls4fgQXWLnANt/H/f2r
         w0NqYZYSAFqUrLEyDvhCw3c5XeNPAnsNCNcB8Gbpkp7Lp7wWMtDZun6YmuuwZ2miNQzv
         GyVIE3fQpTY4pzbZol2ubdbVB06ksudjXrW+7Zv5t9l7SB0Dlqx0P8wjXbgk0G/a2lhg
         4YUBySEHhQLteTRtzTvujwoOshZRy9WWjYQKiSZMugGsQ9bkia6SYYEZsHTSBQ320vXC
         w38g==
X-Forwarded-Encrypted: i=1; AL+hErHPGH6j1l6sKy38nY2nvgSi6iXB/7tkEbTUz1CkH9QzLKkx5zM5nRXrE4/UVrnY2++C2HEOGuvW48r1BQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ciPD79KALYtsKCt2QUo3fLeDmusb5RzpzKJlK8MfwHMGq1MEt
	uTovmyaUgBRfY/IfMQyjg4uYWMVMO8x7927+pkicgr0gri47qmnL5vE/
X-Gm-Gg: AYBFou2/T/a/5DMtzfZMQJQMp7FZWeURoBKEMHU3U+DThe0QvUR/1wZEpu3MVCfnv7v
	TlSMwuqVSVLllMeHtQEy+ODu72cVyYvJ3ixocy1feDuEN6HW3FTffsUd2fGz8X/faLKVgyo8xDb
	kn/BP1kRw8EzDGmcra+xwT1b6BVcIIpfnncfglBAFWiY1p+iRRz92Sd6hEPaSivrw5wJJnW4MyB
	8vdjWlxQOxhDL5yowwuuLkKNsFLahsKKN7tWW7OlaN5OYJgDdjWBI3TxbOBnxHrLqGNqOjstsjZ
	Slfn4OHccktSzenAP5bfe00yJjdQUT3cLvdjWJ3zKEELe5RtJAqI/apvoFEc6Cqz/miC8J69ZYt
	GYXf+/jI4/BxU5DlKaVOi4s7swJdip2ECp7kPegKWq3xGbz5vapsSp+gbFZLiwmCbAC1or7QZFw
	XYAEyBleeNb3tYZaTX7zuWhsiKgxSjRfIqdoUcX+UD27MM4ojRD3EToCySSx4rvjyaHLFPiac8y
	vxeI++JUEtkn72dkPR7w+muC6YNTQ86fjYPDcbLJ0lBahC7srtMw/yddLmuw780S+t5TsOsWFTW
	9NYjYt6fTN3Xx6XE/dxBN00zHHO09w==
X-Received: by 2002:a05:6000:161d:b0:48d:b940:af7a with SMTP id ffacd0b85a97d-49c74d2daa2mr4041400f8f.55.1794576265256;
        Fri, 13 Nov 2026 05:24:25 -0800 (PST)
Received: from [127.0.1.1] ([196.237.238.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60d9fff8sm5377498f8f.52.2026.11.13.05.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:24:24 -0800 (PST)
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
From: yass27106 <yass27106@gmail.com>
Subject: [PATCH 0/2] qcom: add Asus Vivobook 16 X1607QA DT + LPASS audio clock
 retry
Date: Fri, 13 Nov 2026 13:24:21 -0000
Message-ID: <01b2c920412848ab85493acc2d4f5fc1@gmail.com>
X-Mailer: git-send-email 2.45
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
To: andersson@kernel.org, broonie@kernel.org, srini@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 vkoul@kernel.org, tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
 abelvesa@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com

SGksCgpUd28gcGF0Y2hlcyBhZ2FpbnN0IHY3LjQtcmMxIChhbHNvIHNlbnQgYXMgcHVsbCByZXF1
ZXN0IDE0MzkgdG8KcXVhbGNvbW0tbGludXgva2VybmVsLCBhbmQgdG8gdGhlIFVidW50dSBrZXJu
ZWwgdGVhbSk6CgpbUEFUQ0ggMS8yXSBhcm02NDogZHRzOiBxY29tOiBhZGQgZGV2aWNlIHRyZWUg
Zm9yIEFzdXMgVml2b2Jvb2sgMTYgWDE2MDdRQQogIEluaXRpYWwgRFQgZm9yIHRoaXMgU25hcGRy
YWdvbiBYIFgxUC00Mi0xMDAgKHB1cndhKSBsYXB0b3AsIGluY2x1ZGluZwogIHNvdW5kIG5vZGVz
IChXU0E4ODQ1IHNwZWFrZXJzLCBXQ0Q5Mzh4IGNvZGVjIHZpYSBTb3VuZFdpcmUpLgoKW1BBVENI
IDIvMl0gQVNvQzogcWNvbTogbHBhc3MgbWFjcm8gLyBzb3VuZHdpcmU6IHJldHJ5IGRlZmVycmVk
IGNsb2NrIGFjcXVpc2l0aW9uCiAgVGhlIExQQVNTIFdTQS9SWC9UWC9WQSBtYWNybyBhbmQgUXVh
bGNvbW0gU291bmRXaXJlIGRyaXZlcnMgcmVxdWVzdAogIGNsb2NrcyB3aG9zZSBwcm92aWRlcnMg
KHZhLW1hY3JvIGZzZ2VuLCBxNnBybSBjbG9jayBjb250cm9sbGVyIHVuZGVyCiAgdGhlIEFEU1Ag
R1BSIHNlcnZpY2UpIGNhbiByZWdpc3RlciBhZnRlciB0aGUgY29uc3VtZXJzIHByb2JlLgogIENs
b2NrLXByb3ZpZGVyIHJlZ2lzdHJhdGlvbiBkb2VzIG5vdCB0cmlnZ2VyIGRlZmVycmVkLXByb2Jl
IHJldHJpZXMsCiAgc28gY29uc3VtZXJzIHN0YXkgZGVmZXJyZWQgaW5kZWZpbml0ZWx5LiBBZGRz
IGEgYm91bmRlZCByZXRyeQogICg2MCB4IDUwMCBtcykgYXJvdW5kIHRoZSBkZXZtX2Nsa19nZXQg
Y2FsbHMgaW4gdGhlc2UgZHJpdmVycy4KCkJvdGggcGFzcyBzY3JpcHRzL2NoZWNrcGF0Y2gucGwg
d2l0aCBubyBlcnJvcnM7IHRoZSBEVEIgYnVpbGRzIGNsZWFubHkuClRoZSBEVCBhZGRpdGlvbiBp
cyBmb3IgdGhlIHY3LjUgbWVyZ2Ugd2luZG93OyBwYXRjaCAyIGlzIGEgZml4IHRoYXQgY291bGQK
Z28gaW50byB2Ny40LXJjIGlmIHRoZSBtYWludGFpbmVycyBzZWUgZml0LgoKU2lnbmVkLW9mZi1i
eTogeWFzczI3MTA2LWh1ZSA8eWFzczI3MTA2QHVzZXJzLm5vcmVwbHkuZ2l0aHViLmNvbT4K
