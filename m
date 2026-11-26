Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674782;
	b=y5NL3jb/Y9cYQWBK7NEWEOIEh5rKnO8tdb6NAbyCj7qzqjjBZKoKXnQYk3pkiD/TFYa7
	 p5XoYx3Ab0e2DZoORV0MAC/tYs38LVaye9fWbTs5Z8Fwszl7cvDi6Yh2j4jYI1mIy41Gl
	 jnKmrPuA7xYItNQN+/CpfnUXySpygSoL7dtkKomT4ZwiY0vctOeEaYm3Ub0rHqsRHcc2m
	 mqYznW+vV/K8Uta2dXoHhVnv86Y0WHgt/uZ8Dlm8r+nlBuZjRIB8tAQlFINsxH3DJrf1c
	 LiwyfMUT5Of1CGrTwahSXnJ9Grc3IMTpAmWCEZkaMDliGyMVOrfKau+IIpV+7UwHAZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lRVIMYvdf6lF/95MD5+qUVrsPegHxOugjRhGDq12MEI=;
	b=OgOHuOk3nqWeUnxEejYUWl71c5ByC9Ow7/O1DaqhDZDGsBZFO1uyEBjxrVusTqhMrha2
	 BuCNM8/AevMUWC0k6ayyaLUJuO+McTYQYqhBK0ZmGlhfGdFgmrCVIGledHCIXdOs/Qwds
	 lcZlsHd/wOHUNfWT8YbtIsfU/L1D/pDSoUTVNBmig5LEn5u2IyM/ULJRfVEOGys2zsPrj
	 Ppg5FV8aeEyOvc38mJX3A07ZrVIWak0q9BMVw6TlN8H0oQsqgR8gfNV0pnpzdd9ftYkTg
	 HAodLSfqg9xZhvHp531HRXzi7gnACSFserhMiZ2T75NAsg6rS8feTk0P/c09BNA/LQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l0sP36HN;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C312606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 06:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C312606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l0sP36HN
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b244fb7fffso7030272c88.1
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 22:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795674781; x=1796279581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRVIMYvdf6lF/95MD5+qUVrsPegHxOugjRhGDq12MEI=;
        b=l0sP36HNYMiijmhcqdtbL2X+/zWUx85UFFKGYk1Di07BB+WlgxTHPsfW1zKRBl3HE7
         HmpT7YRdNQxI4ESP0kM6GsnW6JildF7J/2D1Xor8SAEQOLkN4mhARWCPmcmXevpW/gqr
         Iw3q6DfJkfOMd04PrtIdEUNwyuO+iiQ4H6SrBeX6TmBksIghkJ5clK/6Bzb3VHQdZ0oE
         8FX078sj0vUflTIQAm02ClwgqGr/Xgr1AOb+w02vUfuPkWwQ730biRKa+mMpx+sTyJQL
         EQOGDbPk+gBlQaFuDCNniuiznMBZJoHh0g16Lxj8W7ym7pYgPxsbIcXln3nLwjqCJsFy
         Dsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674781; x=1796279581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lRVIMYvdf6lF/95MD5+qUVrsPegHxOugjRhGDq12MEI=;
        b=WAEQMg7gOCmnPRsmCc/GyYEQuubAKWUjRl88hgrpC6XAzWvFwiJTV9StwhL8YOJvm0
         C45CdtAiIjepjZk1d3z0/YM4GjBDGSIY6K1uBFeIDYyR7ZOX7oljFGCexLInENMMlhKU
         uRF/R9fge+l1n+WRybU2BuhQ1WCUM4tzA5FtoeH6QnwOICoiNIj4YDc6oQkK6kSkHklI
         g/0lubBoMksMO9F3CykzMuoL1f+ARglYOYNbiW4Yh/82gWuMod4614ydoiIsFGggVvlL
         vJk5Jpwge6M5tD1OKvpZMVjTwAaH9Zeo2tHM+pLfgdnFsMdSdO9yU5Dd5QXkhYxsW1IN
         wYTQ==
X-Forwarded-Encrypted: i=1; AL+hErFQnnffDwo4B6fT9RH72l9MiVaq0Nlu+lxl9MyIjIhwUz7k9eHflWMN/hSAvDT35ZFuCl7pHbGvQscRYQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/7AFko6/iMmMZ4aoGLdDzB7Ynrf6z2iHvEEkHGdjWDiHXBp1sf
	juUea4fdylc88cEG94BmeDqd6tzC1POJT4w+Ldejnwlkau7VN3LXNZk4
X-Gm-Gg: AZFdTZcQjeWYTQPJ/RWB1+6FJqBCPRDy90AtGlvYbQ6D+N0VNssmO29kgouNRCC5anf
	ZCPFKovcRx3IOlmp69QUfLAmDCyyapVmmazdkZvXivez1ImH7+xrSOMyWDm5K3DUbE5ezjoctni
	yDXFYHaV5FSoNil3ReMs1Ne18NItnC2ZN9aJNg0kAzrPvEBF0bZLnsH6S05NpaYDa7kDyDDP10Z
	GKCig29ScR3YRgZD3AeXvA6wqMVEjF6Vm1o3CG4M5CcMFmxMO0CTB9NfIphdkMzl/Bh8M7NZei+
	UfcxtQ0vBOyoWM7fmg7FZwXEmnpG/CJSNSb/VSN+bkZrNXlRL+tPQeG/7DadzzrvZKlwaydqafr
	q/sDKy5p7GBwwIG/ahWCs+C5BnQ1qD8zUdAsPWby3ajr1rJcuQ6dwAz20je/baB5OY+naJ/hojd
	/wewBAm0VF+2OUsfEtAtAYfXB4XMzpolEte2mVAwF+E4ul51C2ajO45CT9rc0Llnt+4jiLlIN8b
	d6cbSzKSWlKV1WaA/ibsQ6YeSdglM0JvEhhfeQTlVRsrSdCKbfKdNJTEOEtY0pfrJkVbkRfoRLq
	Jq1D+hktpu73FNSyvI/ar6xRg1EAWmo2eCiaT/3wF4qdJQgESaY=
X-Received: by 2002:a05:701a:ccda:20b0:1b5:9075:232d with SMTP id a92af1059eb24-1b590752372mr1359447c88.29.1795674780587;
        Wed, 25 Nov 2026 22:33:00 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm76423745c88.9.2026.11.25.22.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:33:00 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com,
	perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: vmaster: Restore follower values on put failure
Date: Thu, 26 Nov 2026 06:32:25 +0000
Message-ID: <20261126063225.3166-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126061910.2840-1-sreekuttan2156239@gmail.com>
References: <20261126061910.2840-1-sreekuttan2156239@gmail.com>
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

Restore the cached follower values when the underlying put
callback fails.

Otherwise, a retry with the same value may be skipped
because the cache already contains the requested value.

Fixes: 3b0a5f22d464 ("[ALSA] Add virtual master control helpers")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Add Fixes trailer.

 sound/core/vmaster.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/core/vmaster.c b/sound/core/vmaster.c
index f43144ba2797..f5cc11eba25d 100644
--- a/sound/core/vmaster.c
+++ b/sound/core/vmaster.c
@@ -193,7 +193,7 @@ static int follower_put(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
 	struct link_follower *follower = snd_kcontrol_chip(kcontrol);
-	int err, ch, changed = 0;
+	int err, ch, changed = 0, old_vals[2];
 
 	err = follower_init(follower);
 	if (err < 0)
@@ -204,6 +204,10 @@ static int follower_put(struct snd_kcontrol *kcontrol,
 			return -EINVAL;
 	}
 
+	/* save the original cached values */
+	for (ch = 0; ch < follower->info.count; ch++)
+		old_vals[ch] = follower->vals[ch];
+
 	for (ch = 0; ch < follower->info.count; ch++) {
 		if (follower->vals[ch] != ucontrol->value.integer.value[ch]) {
 			changed = 1;
@@ -213,8 +217,13 @@ static int follower_put(struct snd_kcontrol *kcontrol,
 	if (!changed)
 		return 0;
 	err = follower_put_val(follower, ucontrol);
-	if (err < 0)
+	if (err < 0) {
+		/* restore cached values on failure */
+		for (ch = 0; ch < follower->info.count; ch++)
+			follower->vals[ch] = old_vals[ch];
 		return err;
+	}
+
 	return 1;
 }
 
-- 
2.55.0

