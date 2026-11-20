Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795153087;
	b=v2ndyUh3eZiF0UxAPM4qt9M8dJ/0sOLRqGkGo1JD30OQU6TdpqDAAAFVRjp7RJNNobgQ
	 uvKFL/F+EE8Oz2iWyImGfsEsMslBodoED8UxMQ7NU2mwcAhBmtsqYIRQNA7yfV8N2ycvw
	 mDZ3taCB+25iryKBfU4bxSOLD6RBRrQsgWVzw6MlvcW1bh8qWlcPYAEIivIUB0xJ7SmXb
	 zbrdUeC4UrIx36JClxiTqqh7FOM5LvTZPKH2dTXMnUHDhA5sz0pzS8R4uYbams5rZEv1X
	 MIXpUOsWgqIxxcHhX46BJqdRuRv5UM9IM/HmfYuYxRyenznOEhwNy0wpcmhuHst4M8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153087;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=jDpsk1/lI6+XVtf9gZGOXGxryMz7hNIRZGd1jFeHMOY=;
	b=dP3p2F3Jd/bBDLv03kKVXYTvVF2Xw1K9msjt4Pa3H3FQztw5Sl1eThP8J85XIBT47eDG
	 g1GuzC49ufARLHbouypCr2anPN9Kf0KPDxDWi46UaImpsKo1jIQaE4m6sEXqP+SKGidUV
	 G8azOh/P0TDAyeb0U/brIHAphYK2fAK4dQlWqlKlQpnUAvEs0JincsAaXu5jUGMCEVUTG
	 7JlvS/lFGZfCvyPa5qmLwTAhMLXw7qz/3Ufu7e1xB8WFDWKgYkf88JRFWmVvZzgxed9fP
	 oqBOdR1cj923XW3W0yG/s9oBo0jDf2MMKXfHwVO/XHxo1KePjWRKRMw33lp7CPRmZdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFlAPdGh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9233606A320;
	Fri, 20 Nov 2026 05:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFlAPdGh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795153087;
	b=wpghpT3fc4kyPl4LSwEMpUtGWvaq0pLLUvodDrqlZhkAmDLs1KM91xwUHo/Jw+S6S5RB
	 brOcCWJAjMaWwb5rS9KXQSe0v4iZ0Q7vvBk7gngKH//O9qrmza/enw3QJmcYD4a4hj/Et
	 5GFulbIIBhxqd4NYxJeYELnDucqeP0QeFg/swr6v8tWWMTNsSmuYw9zkEjFJ0UDk6pnzk
	 XwS0+yM0VxHcurlWDkMtTdrj9vpkSjyEaSu7XXzv79ULY/xvc5GKELEdEU+kd7tZtVRUk
	 rHu90/Zi6oVoslf1Cc1imgH1flQ839c5Wgk2Qib9M17CN9dFvyHQEJfH75EgjQu8AvQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795153087;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=jDpsk1/lI6+XVtf9gZGOXGxryMz7hNIRZGd1jFeHMOY=;
	b=QpOjJDiZ4kduWAF8tGSgDrnZ3aNvmaC9cWVt9+G3QfLI1P+CDcJCKyucVKn825+AhdIv
	 DrSyFl22R4Vj3PGy9pk2qJlOxTm5QGsQfjwIRJRPrqwlVxi2+hTRrIdVaLn8gjUo4M3S1
	 vlFimI3BkszF2gV7RzSDcVOZaqy2QVuG1gTN0BI688vXRK/uwloB5k3Ks6fLYflbSGgz6
	 Ds4NBdkTHTGGcNCsI/DEs7kyhKEkHV5V375sJ/+ji2QNr7/gFxYou5DIAZSCuj5hkkWG2
	 TDTJPl0C01FHf0h7zTDId8gHJXPM9IaO2WDcvbuxV0qOCY4GOtAtb9i24ttDRMBQimw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 10E701F000C6;
	Fri, 20 Nov 2026 05:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795153087;
	bh=jDpsk1/lI6+XVtf9gZGOXGxryMz7hNIRZGd1jFeHMOY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FFlAPdGhM74nZPhIOt/7CbvInyJpS3WQDwkUCiSPVfteu6TuZ29pbn8qKVhAjW0wf
	 M7tm2j+3KnI3f4E1o6TX3tSfBe0ORZprAS+/APD3LtFZaL2gQa/4VE0IP4W5HazPn/
	 Udi2Koafyc+OVGpzSVenbZZO7rxtJuSVKSt+9pIv9gb1uRwrIXnW99jtO00LAYPN6c
	 aOtuXyFrbpoArUp1++y/cVwTxo52HJvd9UowtKy7Ybw6ZEyu5XKdDHK1mOFVpJG2eq
	 tHpJWxsmu2i+CNFh+nKGXtEKMXBAc12SIKR8VvEusBtQ17tZ5UWvjZglcwaaDUDSF+
	 rvqlcVzslOqJw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8EEEA496DE;
	Fri, 20 Nov 2026 05:38:06 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 05:38:05 +0000
Subject: [PATCH 1/2] ALSA: firewire-lib: Rearm the FCP transaction after a
 bus reset
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-firewire-busreset-v1-1-8bb9079a2984@gmail.com>
References: <20261120-firewire-busreset-v1-0-8bb9079a2984@gmail.com>
In-Reply-To: <20261120-firewire-busreset-v1-0-8bb9079a2984@gmail.com>
To: clemens@ladisch.de, o-takashi@sakamocchi.jp, tiwai@suse.com
Cc: stefanr@s5r6.in-berlin.de, linux-sound@vger.kernel.org, perex@perex.cz, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795153085; l=1810;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=EE0vJ5UFqV3N6FNYlkeZNWSM/T/1oLRQlOmSvnwwh9g=;
 b=s2EAJox6FjbrpFgp6SBB/2R+YVmgxiG6MCYUTB3nsjnSxeNnaRiDs0ZY7Mr46dbd67uhBexKL
 K5eKsEuRjngCMFmpPJObtvnSx28t/G0b5okxp6rBwJPJV4iEXd1Ls76
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

When a bus reset happens while fcp_avc_transaction() waits for a
response, fcp_bus_reset() moves the transaction to STATE_BUS_RESET and
wakes the waiter, which sleeps and then sends the command again.
Nothing sets the state back to STATE_PENDING, though:

	wait_event_timeout(t.wait, t.state != STATE_PENDING, ...);
	...
	} else if (t.state == STATE_BUS_RESET) {
		msleep(ERROR_DELAY_MS);
	}

fcp_response() only accepts a response for a transaction in
STATE_PENDING, so the response to the resent command is ignored, and
wait_event_timeout() returns at once because the state is still
STATE_BUS_RESET. The loop then resends the command every
ERROR_DELAY_MS without counting tries, and the caller never returns
unless sending the command itself fails.

Set the state back to STATE_PENDING before resending, as the
STATE_DEFERRED branch already does.

Found with a static analysis tool and checked by hand.

Fixes: 31ef9134eb52 ("ALSA: add LaCie FireWire Speakers/Griffin FireWave Surround driver")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
 sound/firewire/fcp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/firewire/fcp.c b/sound/firewire/fcp.c
index e60bfd0ee4ac..d733f6123baa 100644
--- a/sound/firewire/fcp.c
+++ b/sound/firewire/fcp.c
@@ -273,6 +273,8 @@ int fcp_avc_transaction(struct fw_unit *unit,
 			break;
 		} else if (t.state == STATE_BUS_RESET) {
 			msleep(ERROR_DELAY_MS);
+			/* resend the command and wait for its response again */
+			t.state = STATE_PENDING;
 		} else if (++tries >= ERROR_RETRIES) {
 			dev_err(&t.unit->device, "FCP command timed out\n");
 			ret = -EIO;

-- 
2.34.1


