Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798230;
	b=fn9cxGphx9oo+EjIahRAxRDFcnyLq02zOhF85wuA83wQfUYntgLmNyyHYrEzg6BxEDYM
	 448kjgfFIIvJQZQjwoDNO6kfg0QFlBSeRczyE6TfK0UsfJkCDuDZqXpNObge0ZgpHViKV
	 7ogF0ASqYa5n5tknnEzULt54I2OKabsK5ikHGnZog17Y/erJdFmMrRQbbGFIj/p/71kmt
	 f9glXTPyvO9FehSs/BFx55og6o36jaPD0n9pBjGcvTgmon8bPLrzyeqB79O0U2fagXHT0
	 drAPIrgkdSoEUKNDeAKVYcekTpdPuHK4vo/bRSEadt+m0+Fj8BC0vPVMerqliAEqkKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=taZmjC+r+n5amxH5ylYkvKHjlAAevcJwdM3ESN5VOIU=;
	b=KCLHxthX9xLkNY1tWu6tU8QKW/1IO8IK5SdeEYgVHaDONRxyWDWUPqb3vWvk0Xoj4YiR
	 3vh8llyPzW8iJxvLwKCcWPZjq/KUCav3by60sD4uue31RZkNL79m69wq4ZgS8Gl6PBuwA
	 DjML5Lt+m5pZRAEwH9VPAdQv7JCPWcASBgea51sfcZeT0pMjaerq98Op7Tf1vWsSjJ3A4
	 OPEiN7xTTMEa960+Nk5lDk+a87N1GmpeIC2O9YXYDM0a/nvTvPB19+8PbX0IuLwBkxZdH
	 wuzqBbHif9uK6pym7eF4GOOST1th9MJqmjtny0dlaAASQxGN+ICe4/TqjmRFiaBhkww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cbuhLi0k;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6CE606A88D
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 03:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A6CE606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cbuhLi0k
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-372bdb942dbso2583881eec.1
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 19:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798225; x=1795403025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=taZmjC+r+n5amxH5ylYkvKHjlAAevcJwdM3ESN5VOIU=;
        b=cbuhLi0k4gPQunm0cCmyXkobLQ+2PbqWxQNlMMwNnijYec+2l1ABQqA7z+WCEKmsxO
         zvKYa//6SGPJMW8Gnle952xsq2krkWRMJp+Lf94BVv09Wr2ZG3wZvzeZX5xTesLlFtO5
         1xGajNIVDjGJ42VXgqvefUaZiDClnCWMj8Ld4jC9YVh5maMEBZ+b+9NTq9CY7l1Lr7GJ
         6T3tDDaw1rwFNGcEI42z/f8r0Hhd/jL7/3giFsMcA3S/zb/eETdElF5AopnnxICyqLrb
         pQtyeMQZEpgYCLeStJFwIjdUkthkrXIofhMLqbPwmxrcvO3YAl8aA4tfWhzgLByVMjEA
         zRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798225; x=1795403025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=taZmjC+r+n5amxH5ylYkvKHjlAAevcJwdM3ESN5VOIU=;
        b=dJZ9LB8H9ag6dvIXialcDumTAnKVtXc8lhLcxmbWlf+R7Cz7uO0Irbvi7prM6LSLPZ
         qhTOvN6IQ6ky4+GiocVPgzeYWkFqXoklt+mPQbZ6ti4y5K37vkRxXsi6Lk/2YO4sVhVA
         kf4j2x72o8mSF7+fkhA5E+1Rs1dcLeJ4sgsBXAvp3SlUdxsfAo/+FwkH40+u3OWcrYWU
         89+YHvepwxZhYR882jsZazc/6ljn2HI9d3Foh51uzcd2FQOyBnNvoE+h89H3RqtrIU5f
         E6e/wU4NwOU2lC3JVkxaQwqe+2Yg+mM/Unwj2DxqMP4vDsnqXNAaaheSBJPg+u/8SO6n
         HILA==
X-Forwarded-Encrypted: i=1; AL+hErHJ3Db6AxkwPUeIGh+89IwWznWbRMcx1k0Ky84JEHcQpBS59D38o8MeM8H61qcY6iC5Lri8uRppRYi0Rw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+rMb8lsCQFETEJNT3Ke1LFIgiof40SqB2c8v0sVh/unfvP+sk2
	tpCE17wxwrgHMX6UAOMoqQyXs9/nQ/cNQq1GYJrNQsPx1lmElseJPzXK
X-Gm-Gg: AYBFou3r1F2lhuOE01alWYP9l+eT9kXs/o0wSz2INQbCbSgobRchEbmNSC3RZ2sHj2O
	hMVSi2zkzgNrxpueKSFOKazuFVuqHHU7N/gIg2t2q3XiAU6u+5FO4yuJlJih6Mt+QUSXjpXWvvV
	q/QnMdNainJ3r46g6Iz/911wpzzDEmTuTF5xsrU/J6wPybPQGwLXbwDq9AKgkaFCxcixy/GIRDL
	md4VVv7q05eHp3Wp/UV2BgrQtqhZ4W7BN37TnEjs9eLUAWjNoDiIs6M4cA94biRDw0wbCqp7HrH
	yClJ5EcaAmSC8dbuLBswxFL9/O3qTLVzasJAIiBl5uyQTnvAPaVNt0v3evA1nP2XZWUpe87e3ZM
	BS+CcL0cFXj816L2RJ2GerdsRUpOA+ZVry8/i4HSuxxHUZcA/ezEAJ6DnxNXHK0jQnlSNAqQIfK
	j+4emS9qAH6DKXlEKyIth8fALisbPn9ycoj47azDhBCDRXnVRm28kyx8PNfiB9v+vlm7ko2uGGq
	EHkXOYMEMqZ8Hm3LLNpr+rKhkQ5U0RntAd7tdktU0gl7nnCxeRMXwesbPksDvT45ydgSFnMS3oa
	pXoyzULUbo4FlLMbz9P1wG14Le/RGMPUnvdoSjEeJn+lP4D0WiQZcPGek7vcUXhNaVPJF8lGq8y
	uNTwPBHeC5+OV2zn+Na0dE8+Vy8W9MyKz9KtYMz7+
X-Received: by 2002:a05:7300:d40d:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37966e3a7cfmr10269605eec.11.1794798225248;
        Sun, 15 Nov 2026 19:03:45 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm29195595eec.0.2026.11.15.19.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:03:44 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 0/4] ALSA: seq: ump: Fix Note On/Off and key pressure conversion
Date: Mon, 16 Nov 2026 12:03:33 +0900
Message-ID: <20261116030338.422671-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hello Takashi,

While extending seq-ump-test, I found three conversion bugs in
seq_ump_convert.c. In each case the UMP core or the other sequencer
path already does the right thing, and the fix follows it.

Patches 1-3 are the fixes. They also apply to for-linus. Patch 4 adds
the tests on top of seq-ump-test.c in for-next.

Without patches 1-3, the new tests midi1_key_pressure,
ump_midi1_to_midi2_note and ump_midi2_to_midi1_note fail and the other
25 pass. With them, all 28 pass.

Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64 under
qemu, on sound/for-next.

Best regards,
HyeongJun An

HyeongJun An (4):
  ALSA: seq: ump: Don't turn a zero key pressure into a Note Off
  ALSA: seq: ump: Convert a zero-velocity Note On to Note Off for MIDI
    2.0
  ALSA: seq: ump: Keep a soft MIDI 2.0 Note On from becoming a Note Off
  selftests/alsa: Test the sequencer UMP Note On/Off conversion

 sound/core/seq/seq_ump_convert.c            |  10 +-
 tools/testing/selftests/alsa/seq-ump-test.c | 187 +++++++++++++++++++-
 2 files changed, 188 insertions(+), 9 deletions(-)

-- 
2.43.0

