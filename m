Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608770;
	b=Pdfkq1WjkYzalK+Ceuzhw+A18CZN8gfaqOkKtxH085iiEp9I6OCMMyJhCiryLcjJP50j
	 0yzDMyvYMrwAc0aPbPCCDY0CsNXGQ4SLHuBLcSawTd4v9u4dKDZAXT6L9X8dcRmlTIu1T
	 gbefvtsCI57l/drms6jgTrhrgeRJYvWmvc8u6g7mGSJazhN7/fChH1CDI8pEFj+Hd0MPa
	 XTQEKYtUHC6srwGQ0/c+Lan8NMUtnes2m0cNM7OhKCXx59AMgd+R5NksbKbz8tbtccK90
	 xPJYqE0PqXeTV137tLB9mSada6+4ywwy3VGa3qRR2Rpm+4wTCCZXt7SHojBRmiZ/ifw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YvZ+MYm/tEerVMyhRfgrUkzK2+6reEodKLZZg+DwbmQ=;
	b=hxSaV+aePPfAfAiPbNNgupM7rRSI/TrAICKe677SRDRSWFEF3rkRYqC4VaJL4y7sJTxI
	 Fpiiw4xx3160k1oHfTdoaV+n8I6CJq1V2BKoCESzdfc2aPh9nqoLdHu24ipeapPGk6a7O
	 L+hGj1My0KYaL/WTkMeMiFJ+UPUrNK66qUFZpsJl5TakgMzUFlt0fI380FNdujXQp2tyu
	 wSpzz8Q7iKqNl19ATr9LETQPLlHWDKNn+HRNsns7bn/n9C6fjIECUkcTZXyrhCZ/vg0JO
	 6vhnFQHu41JA95Wj7RPUZ86VMAN//YLYjxm32mlNwIR+8MyUtARPJCzMxFVXUwYtsvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZDmtFYMz;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CC1606A321
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 12:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2CC1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZDmtFYMz
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso2827372eec.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 04:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608769; x=1796213569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YvZ+MYm/tEerVMyhRfgrUkzK2+6reEodKLZZg+DwbmQ=;
        b=ZDmtFYMzXcImZicAXIG8oXjEPLiR1MKbH9dxPWNJwHFEgNeAJC7LkbkdEV9lEelwmU
         Bf49U3MLLDqAC0e28Oty2RTJDeOWsP+YmjsAoGldobmSHc7gWO5cJZuveAtcy7JhEqZ4
         boRSIBrN9dNAjXCblnkl1W6JJqwZSWJ37kwnXRlajuPUIys++GMRUIohsUsBguX5fBbr
         cUZ3JhPeSu74kdpn6V5yr+/ikAMSTynXUa6q8E4wclOwC2bBWc60POoFwnHo3hDgkjo8
         vvXUHGPuCePYsT//3C05yj0GpFNXb8sgD5NOsEoceQ3JpSuQAV+WmRxAdJtfBvwQp6fi
         6sEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608769; x=1796213569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YvZ+MYm/tEerVMyhRfgrUkzK2+6reEodKLZZg+DwbmQ=;
        b=RifNoO+fUnvmTkBxm1iepzTqQ99SUydmYYy0PpoNvsuj8n4CohbnbrdICNi2e/sgC8
         IoTtvHCd/eJDOKO1nKKVkR2A2/qgEYyKL9K+SWxWkeDHWCYBAtaVShf7yaaYayRKVEec
         1YBOUr6lKC1Mrft2dXfeimwNMsPFc9Of4klIKpTS8Yk30CWM2q8/NDfFLYvhnXdROibN
         mADWDfqwQUZ/lzRIShsaMWbdmXcJ0FyUVudenjIW9ohC3I0Ei8O/Nb/x7gcXpl6Hq9lo
         6AICqIJZa11G/66eigubysGpkLIcNgzFAuUub8UtmTPWQTlvFRMEZ6t4f7Vo7uHFq/oB
         PJsA==
X-Forwarded-Encrypted: i=1; AL+hErH4CIhqRaPyoAqN/yH9QFFMX+twFEIqSuX4N6vY21qK8D2ilTWKtm7wdg3OSd0J6kIirWUmN1BfY9gvIw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9HOpaXvPZxgbmxS+EYIjQWR92l7/XRpaUw+e/s34iNJP2FN6IU
	XKrlsI09EVjaDbVNvqOpUc4qxrGgY7cxGjexctF+9m+iEqRqfCe3r2w3
X-Gm-Gg: AZFdTZe3J6l5iiONVUumb5KQKfagH7RIa/u6rBzSRBbIKJr4COrMUQ1ynZbygyPZc3Y
	KTgL5h6bl3XUAsRoFo7B6M2FhZt6vt5pHvE58l/kSXnzjcvjYCbanMGMiyzxiHg2+fHa6deAQkI
	HSv+mwfKBlIxqPESqrMsUhflLOX+70DPj5t2oc6v6K8cS4ydavKPgJP4gfhIFLKTBQMDGk4bL3D
	bcDbnG70QhAdaVc7GEIuws53gbT9UiOLUwsNiVNH5YQWrR54larOiRXRBQm5BTKeL2tTbniKyN9
	9uFGZy9pumjkAyT2SgcwqrrPKgzych9GCaZD8xkWyDAsPcbKIusXfT954tctjMzMRpwdd2J2d7y
	acE3Bdi2XKlZJzCuB6yKM7kr+JvCn7vQtUzOhemLvmbDGRyK+sDHPFtIXn/BR9BNUAEFMRmAZmt
	mTPflhfLEurAVwtAUOf0KTrvy/WhXc1ly06W/a60LZOnsaIoFNUt9PwuwaZC1CJ8n2+iBHLwJcx
	0HV7C2STWzaligTUZ25Wjx6efuzzXbCh4AsjbDeokXaFwfl/3skKfdqRRX17LP+K4GRvQxAaPbD
	nPKShH+AeuJYum8S/OXpiTp0vLGtd7eEZuznLoQ1NFxYzzLdtZaJFg==
X-Received: by 2002:a05:7301:a0d:b0:369:fa21:ba0b with SMTP id 5a478bee46e88-38570847a85mr20043418eec.33.1795608768857;
        Wed, 25 Nov 2026 04:12:48 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm12234336eec.17.2026.11.25.04.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:12:48 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/3] ALSA: bebob: bound the stream format entries to the response length
Date: Wed, 25 Nov 2026 20:12:37 +0800
Message-Id: <20261125121238.1602172-3-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125121238.1602172-1-maoyixie.tju@gmail.com>
References: <20261125121238.1602172-1-maoyixie.tju@gmail.com>
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

parse_stream_formation() takes the number of two-byte entries of a
stream format from buf[4]. It ignores its len argument. A count of 62
or more can read past the 128-byte buffer. A smaller count can still
read bytes that are not part of the response.

Return -EIO when the entries do not fit into the response.

Found with a CodeQL-based static analysis tool. Reproduced in a
userspace harness under AddressSanitizer. Not tested on hardware.

Fixes: eb7b3a056cd8 ("ALSA: bebob: Add commands and connections/streams management")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness and this patch.

 sound/firewire/bebob/bebob_stream.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index 5850357cb3da..8eceafc70a44 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -730,6 +730,10 @@ parse_stream_formation(u8 *buf, unsigned int len,
 	if (i == ARRAY_SIZE(bridgeco_freq_table))
 		return -ENOSYS;
 
+	/* The entries should be within the response. */
+	if (len < 5 || len < 5 + buf[4] * 2)
+		return -EIO;
+
 	/* Avoid double count by different entries for the same rate. */
 	memset(&formation[i], 0, sizeof(struct snd_bebob_stream_formation));
 
-- 
2.34.1

