Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604655;
	b=SrTVKsm3iaAxZOFeUvFH0hJglrzstRuu9X4g7hmi7DZI3FM7UHhrpNoM5xgAx7y5Wbxe
	 yC2IzNsmOjdWoGMHtcKhVFJ4z7YkmHXdZ0N4m++D5KrEQNPkSHajNniUc9oyMGwVUkAZl
	 U2oQUrVCiPkJ20kkc8c8Cj85d3ElzdFz8EsX1BXdb5n4ihSeCDoguPbj5E/W5yq91S/To
	 r+KZoU/A7K5GPsdeRgF1iVSzxzSFW1mhpqZU2JkknTTYH3Bq2B2WZt7AHN5et3T8Yk9NM
	 bH/pik2O9DWNumtK0f1z1mLs1XoP74XMpnl4TFOcFgQmeiAWzuvRvH7s4a7r8661lgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID;
	bh=g6aPUW+7oKXPB34EDeB5hJ9aJz7OSIPu7ZV/Lj6Y/8o=;
	b=ot59hMePgRITY0LvVUXohpd4aBJBNkquT3f3zzF/Gb3UCwlpQNiuTGLqdnCj23tqKEC+
	 HE/uTOBQgjua8nTIXfhBFCIjLyhVgYFe5BJlXt41BHLQ+msYEJI0PyKBi+uYYFogkAdNh
	 z0K6mWAE2QCz6VCjj6OMTTBkQ74h+OQDdg7QvcP/IY5PvfRXevGNQLXBHC2Gq6Q8TVJRk
	 2YN/iQvJfqDOrXcHUnT7/4fUwunLKY5rdmZbK7iahB7c48NLBEVweiQ4OW/29UN3e2Kk1
	 Rnh7si5gqgPzH21AqjSjPatJoxfCzqcyyGjjK/M9EpUCod5b2qyPf3Ap9YqzEAq/GzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O2WBBlH+;
	arc=none smtp.remote-ip=74.125.225.133
Received: from mail-wm2-f5.google.com (mail-wm2-f5.google.com [74.125.225.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFF4606A32E
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 21:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AFF4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O2WBBlH+
Received: by mail-wm2-f5.google.com with SMTP id 5b1f17b1804b1-49e7b06acb8so4819845e9.1
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 13:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794604653; x=1795209453; darn=vger.kernel.org;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g6aPUW+7oKXPB34EDeB5hJ9aJz7OSIPu7ZV/Lj6Y/8o=;
        b=O2WBBlH+sEuEaGq8nMhpEC31wLP5cHyACfvnWFyo+t8kE7jALCAQIcPTk/4iKYTfCi
         SfM6XAr5s6RuqMydSXxsKsgAPnzincklnEBKZZv0jfEbpykjUvXHA+yOhQv+lzPXtdUx
         oS0/tszRxuDMJDIFP3cw91zaMXEOlyOqFoXUTIN7DtElV5HM9S1+nDhwKTXSaU7QN+NV
         kXOBmQC9QvP7wXJh6f7jXHnDOHHzbL+0nWAreDq+qIZCy+eh1p2cK2rBX/bqo9KCJRCc
         +O/8Pq4LXYXiliUbyO8HyNs9N9bFKWwvgXjEjCqlSo6UBTxo6c+/+sUb72QA8+7gec9k
         a/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604653; x=1795209453;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6aPUW+7oKXPB34EDeB5hJ9aJz7OSIPu7ZV/Lj6Y/8o=;
        b=1PmEkjKzBAHQgycKUx823NyUFnt6tY32egW7AgP9drqiIdQGZ/HwGWG3dG9iqFe8WY
         p7binNsxa9gpWmqfUfefAQyB0Qg6rMNmM1QBDyuXmKTWfoy4+ii4ynY0Bp+oOJa2kqee
         Ud5fJ4bj41RbwOj0eb9CH4fx5yd7KJJw0fyj8AJUsDd94xSDJKd/dxKSmmInoIKYPlne
         1hJ8NhS9lRYHgW6Dtf8PVxvGaAhgOEAjs60LQrqgx58tWZQe2BLdJYBFQFeZZ0rAenzf
         vp/+bpQrzTHOKMwQiP1ccgiqdObgGJN4QTjymMuNF5wgMJ4ubMEqEB5tohJMUYq4nH8O
         6MCA==
X-Forwarded-Encrypted: i=1; AL+hErHCPNOd5/mm/8kpB4EH3fI5cLXLgjh9OOZbTr8TWVUYZW9Ofh9Mll/7Vh+QL6tnaCRCv1Xc9R5ET1hjXw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/osgtSPQbmiHRiNRht/RIzVFAG9FVScMxAs95f/9WK9fIQUCx3
	XtVITs0prLkwdHCo7fxcIbdmxViEVFrSsIzpPMKEodiA882vY5WKyi/7
X-Gm-Gg: AYBFou0Ey3+mF3GNi7AGifYZR5pZsDO9q7MfRJ26IenfEMwyh7ZXP2GSgAmENhvbw2F
	BJQKjIef9wY+UtSUacoiQuWuEggjz0uFYzK8bXkbAouNchgTv2fOZPskXe/CMgdjq7cJk0p0qAL
	sO8sqWFf/FhK1wxGkCY/cLBUb+f/fQLtl+P+w6WoLPaYFlYiTc8wZKhKWaPAbz/QeiUyCCLeYHx
	LsCo7ryUY+UQ1gZ3WoSTpZmjQyf092upV5hnWQHyoKB09CnDPAmujoQdUga07phtbxoQYSTZQEa
	exqesFZ2qtNTupoGEZ5idXnflTZh7rtopj+LbpPoQUtSksWboJnqWjjhhrR3VW+xVFbmepIHL6P
	4J+Jl8hsGggxmi800scxWLaLUXAavmZZQstdpjM9PHdD+PgfBrysM2narDBY59qbMBtSi9Q+qf0
	YGl+dnGHwpS1lUKHCkNSgI/C2gnvHcUBuYUftidJNl3DgUATxErQf1qul+5SqKULqGRLlvANRzH
	dxq6b7FwbsZ0m0YZ9RwWhYM/sTwisXlHqt5BpPAo+3n5p8AO1LY
X-Received: by 2002:a05:600c:470a:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4bb55a01bf3mr80266735e9.2.1794604653483;
        Fri, 13 Nov 2026 13:17:33 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f6a40sm30939805e9.2.2026.11.13.13.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:17:32 -0800 (PST)
Date: Fri, 13 Nov 2026 13:17:32 -0800 (PST)
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
To: broonie@kernel.org
Cc: srini@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: Re: [PATCH v3 1/4] dt-bindings: qcom: document Asus Vivobook 16
 X1607QA
In-Reply-To: <d7b0ac39-f204-46ec-9614-460611a7ae38@sirena.org.uk>
References: <d7b0ac39-f204-46ec-9614-460611a7ae38@sirena.org.uk>
Message-ID: <cb70e9d4bc154a52ba5d9351baa57191@gmail.com>

SGkgTWFyaywKClRoYW5rcyBmb3IgdGhlIHJldmlldy4KClVuZGVyc3Rvb2Qgb24gdGhyZWFkaW5n
IC0gdGhpcyB3YXMgYSByZXBseSBpbiB0aGUgb2xkIHRocmVhZCByYXRoZXIKdGhhbiBhIGZyZXNo
IG9uZTsgdGhlIG5leHQgcmV2aXNpb24gd2lsbCBnbyBvdXQgYXMgYSBuZXcgdGhyZWFkLiBJJ2xs
CnNldCB1cCBiNCBiZWZvcmUgdGhlbi4KCk9uIHRoZSBjbG9jayByZXRyeSBpdHNlbGY6IGFncmVl
ZCB0aGF0IHRoZSByaWdodCBmaXggaXMgaW4gdGhlIGRyaXZlcgpjb3JlIC8gY2xvY2sgQVBJIHNv
IHRoYXQgZGVmZXJyZWQtcHJvYmUgcnVucyBhcmUgcmV0cmlnZ2VyZWQgd2hlbiBuZXcKcmVzb3Vy
Y2VzIGFwcGVhciwgcmF0aGVyIHRoYW4gb3Blbi1jb2RpbmcgYm91bmRlZCByZXRyaWVzIGluIGRy
aXZlcnMuClRoYXQgaXMgYSBtdWNoIGxhcmdlciBjaGFuZ2UgdGhhbiBJIGNhbiBtYWtlIGFsb25l
LCBzbyBteSBpbnRlbnRpb24Kd2l0aCB0aGlzIHNlcmllcyB3YXMgYSBzdG9wZ2FwIGZvciB0aGlz
IGxhcHRvcDogd2l0aG91dCB0aGUgcmV0cnkgdGhlCm1hY3JvIGFuZCBTb3VuZFdpcmUgZHJpdmVy
cyBzdGF5IGRlZmVycmVkIGZvcmV2ZXIgb24gWDFQNDIxMDAgYmVjYXVzZQp0aGVpciBjbG9jayBw
cm92aWRlcnMgcmVnaXN0ZXIgbGF0ZS4KCldvdWxkIHlvdSBwcmVmZXIgdGhhdCBwYXRjaCBiZSBk
cm9wcGVkIGZyb20gdGhpcyBzZXJpZXMgdW50aWwgdGhlIGNvcmUKc2lkZSBpcyBzb3J0ZWQsIG9y
IGlzIGEgYm91bmRlZCByZXRyeSBhY2NlcHRhYmxlIGluIHRoZSBpbnRlcmltPyBIYXBweQp0byBm
b2xsb3cgZWl0aGVyIGRpcmVjdGlvbiAtIHRoZSBkZXZpY2UgdHJlZSBwYXRjaGVzICgxLzQgYW5k
IDIvNCkgYXJlCmluZGVwZW5kZW50IG9mIGl0LgoKQmVzdCByZWdhcmRzLApEYW5pZWwgQ2FydGVy
Cg==
