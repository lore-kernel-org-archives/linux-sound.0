Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CD83890F0
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 19:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779133230; cv=none; b=ayMeaUe0uHKyvcpjwLgQ/XRMdO2iaX2mt6mL+7rxumvLWZX6jGM4OUx20TAIPoNRbSDWVnxanbYpnVfy8EivROH8Q6UCUOGmhXdJGb2Hyr8gISi+aVNdnPUsAkXcAGBC7+GlejwunS41Zd21QF3JS3NqIqFp3DDbb7g3U7HCJxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779133230; c=relaxed/simple;
	bh=BuEk7fSX8V17vakuWtMqTXWlzRacwBDKMVQLZec0LYA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t4VBP02YoOJt869iuJUCAQTxHJtetJBO7L2C8zFfybs9g5mEn5Wks/+FGBOHBO/zguNtdHSnZbvRsrtwg8K88zD0qyP3BOspl8gTFYSlX/Kmy1FMj+ZtlAbg5ZfZjkAJ5N45f7EixqJcB2AWxBerA+Fh/ZT3qB+oCIl13/z/z/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NMlK3BhI; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NMlK3BhI"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c798fc1a28cso1113461a12.3
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 12:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779133228; x=1779738028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icbuaBQYuTdOy7kk8RS3OZKCGtT//Fk4igqsQXH55QI=;
        b=NMlK3BhIHrfFcjAD+ejoiRKq5ldA8vHfDngPf26cdTbaHxHXVU4tNlNVqTbdcE4HzC
         e3edSdOpwhLH9p7FPxTZGTyZNq7o6/c+JumUJaBp+Kf9BFmFhhSoZsw77BDKjFum5iGR
         dFfQv0YYjAhcyHkOLB1HJgttj6XCXEtZIqaCvghh+tVv68ba15nmqaH+2rokglch2G0B
         joj7OHF6D8oNRcg46zM1CPd7TsOhPzrEhZKa1B7c1BUivSW+j7Gyaxz8YLGuuqSJiI6w
         pJB8gPROvjzh2yV4LOivLCAt9j3wGnYAh+i9Sq+R5s+V4YhYWSWWMNvA2yp0scsQ81o7
         X9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779133228; x=1779738028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=icbuaBQYuTdOy7kk8RS3OZKCGtT//Fk4igqsQXH55QI=;
        b=EK53OIPep3IP4mwDlu36wNjssYssBRbUaODIvH3zyO8T6mXCcHxa1vV3mtVr1XWick
         Kf29+guTfCDOTvDM4rXVITfcWW1j0GY1TN8SCrnJiHBkQQ25ISRqK26WwoDzkZi0eYeM
         vVpZVBGeo35afcWRbw4DMA9MCuKIJpQcr0gNdENK3XliBxz1pS85yDQwyK7VrYwkpnNN
         yrI8ZLEXOVrRtH2p2uudRPkPeZJDunIP3dbBhwM4ZuvQsrlpzRcTHz5NjkUITUDxfBlV
         qrmyK3V7oENYHSbgqWP45gz151+NB8cliAUQLVWqdqxGZ6x/qCjflKkhTIwTiThJV3Vs
         ZiZg==
X-Gm-Message-State: AOJu0YyzyPc9DtVf4+L1AkopqCuCvJj8vHhaSqi/sZHXQ1tR9Xymnve9
	tvpWUtMUMQHzfY6bcR7jWh/jzTBGMXLsJJK63wh7gzPh5zb1XcXh/nQthr/H9w==
X-Gm-Gg: Acq92OFPO+Ut0DG+wLhJ+mUObgH3xrHsrrk17Om26uhf+7Mp4D0zb6urMCQB7E34rwt
	rUgNxhlPjYw1Djh4e0ySk8VSkSrlY7ED87KH2kcnE2o7oUP7ExilPRErhCgd8iptCMfRe7Lr6J0
	f36GIDjrbelEJ1CSD1TvPKG0tBNtYhGoiH+G76u/pQzA6iTBugleZUy3WuPe4CFJb+bOmDOcSYP
	jGdn6kQOWmTanbyj16ApYW7C6asTDnplzYi9PyMgRKPPcNCJtt/WFgZL7urF+r+FhA9cM3P0q1m
	UJ7PHoDW9oF/NZzTN4vVHh9LjXFNOaveqQou3n9iw8hJleob3ipPsi8ABtoNNivJZCOlnkWr25w
	EmqtfNRzodyHpvF3t2OUNv/kt124Dvm+BC1kjEf6Q2Tjmc8wwCPNg/O1sVV8bUOFJzwoLIeNSmq
	6QFCyhx2XoOqA7CqS6HRDFeoyCOUAPrALqmHuMSrI1xWt/efOwSTljbe6xIb9dWW2NeD/eUg==
X-Received: by 2002:a05:6a20:7f9a:b0:39f:94cb:1bc with SMTP id adf61e73a8af0-3b22e7c24admr19330410637.1.1779133228150;
        Mon, 18 May 2026 12:40:28 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07d2fesm14237808a12.9.2026.05.18.12.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:40:27 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ALSA: avoid past-the-end iterators in timer/seq port registration
Date: Tue, 19 May 2026 03:40:21 +0800
Message-Id: <20260518194023.1667857-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87o6ic4izy.wl-tiwai@suse.de>
References: <87o6ic4izy.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes in sound/core that remove past-the-end iterator
use of the shape

    list_for_each_entry(iter, head, member) {
        if (...) break;
    }
    list_add_tail(&new, &iter->member);

When the loop walks all entries without break, iter is past
the end and &iter->member aliases the list head via
container_of offset cancellation. The insert lands at the
list tail, which is the intended behaviour, but the access
is undefined per C11.

Takashi Iwai confirmed on the inquiry thread that both sites
are bugs introduced by commit 9244b2c3079f ("[ALSA] alsa core:
convert to list_for_each_entry*"). The original list_for_each()
loop terminated at the list head; the conversion to
list_for_each_entry() left the post-loop access using the
container struct, which aliases the head via offset
cancellation.

The patched code tracks an explicit insert_before pointer
initialised to the list head and overwritten to &iter->member
only when the loop breaks early. Observable behaviour is
unchanged.

Inquiry thread:
https://lore.kernel.org/linux-sound/?q=iterator+used+after+loop+end+in+timer

Maoyi Xie (2):
  ALSA: timer: avoid past-the-end iterator in snd_timer_dev_register()
  ALSA: seq: avoid past-the-end iterator in snd_seq_create_port()

 sound/core/seq/seq_ports.c |  7 +++++--
 sound/core/timer.c         | 19 ++++++++++++++-----
 2 files changed, 19 insertions(+), 7 deletions(-)
