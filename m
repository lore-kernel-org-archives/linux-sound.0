From: Dave Mielke <dave@mielke.cc>
Date: Tue, 24 Aug 1999 00:48:51 +0000
Subject: Re: Streaming disk I/O kills file buffering and makes Linux unusable
Message-Id: <marc-linux-sound-93545724101192@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93541443318803@msgid-missing>
In-Reply-To: <marc-linux-sound-93541443318803@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 23 Aug 1999, Benno Senoner wrote:
>In this case I don't need raw I/O to get fast response or higher throughput,
>but only  to avoid that the streaming apps do not monopolizes the buffer, which
>is very bad.

You probably don't want strict raw I/O, as there would be considerable benefit
in some sort of read-ahead buffering. What you want is an open/fcntl attribute
which would instruct the kernel that you don't intend to do a seek, in which
case it can free each buffer as soon as it has been fully read.

-- 
Dave Mielke           | 856 Grenon Avenue | I believe that the Bible is the
Phone: 1-613-726-0014 | Ottawa, Ontario   | Word of God. Please contact me
EMail: dave@mielke.cc | Canada  K2B 6G3   | if you're concerned about Hell.
